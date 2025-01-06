class GetPaymentController < ApplicationController
  def index
    # let's say if we detect the params[prefix] = 'IP'
    # then well only return the queries corresponding to in_patients
    # vice versa for params[prefix] = 'OP'
=begin
  the json object returned will be an array of 2 elements. The first element corresponds 
  to the subtotal cost of each medicine, while the second one corresponds to the total 
  medicine cost
=end

    # if it is an outpatient's bill
    if params["prefix"] == 'OP'
      outpa_novem = params["novem_digit"]
      outpa1 = "
      select e.date_n_time, e.doctor_id, e.out_patient_prefix, e.out_patient_novem_digit, e.fee, um.med_id, um.name as med_name, um.prescribed_qnt, um.price, um.prescribed_qnt * um.price as med_fee
      from examinations e
      left join (
        select *  
        from use_examination_medications uem
        join medications m
        on uem.med_id = m.mid
        ) um
      on um.date_n_time = e.date_n_time and um.doctor_id = e.doctor_id and um.out_patient_novem_digit = e.out_patient_novem_digit
      where e.out_patient_novem_digit = '#{outpa_novem}';    
      " # returns the subtotal of one medicine id
      outpa2 = "
      select e.date_n_time, e.doctor_id, e.out_patient_prefix, e.out_patient_novem_digit, e.fee, sum(um.prescribed_qnt * um.price) as total_med_fee
      from examinations e
      left join (
        select *  
        from use_examination_medications uem
        join medications m
        on uem.med_id = m.mid
        ) um
      on um.date_n_time = e.date_n_time and um.doctor_id = e.doctor_id and um.out_patient_novem_digit = e.out_patient_novem_digit
      where e.out_patient_novem_digit = '#{outpa_novem}'
      group by e.date_n_time, e.doctor_id, e.out_patient_prefix, e.out_patient_novem_digit, e.fee;
      " # returns the total medicine cost
      @outpa_subtotal = ActiveRecord::Base.connection.execute(outpa1)
      @outpa_total = ActiveRecord::Base.connection.execute(outpa2)
      render json: [@outpa_subtotal, @outpa_total]
    elsif params["prefix"] == 'IP'
      inpa_novem = params["novem_digit"]
      inpa1 = "
      select t.start_datetime, t.end_datetime, t.doctor_id, t.inpatient_prefix, t.inpatient_novem_digit, t.result, tm.med_id, tm.name as med_name, tm.prescribed_qnt, tm.price, tm.prescribed_qnt * tm.price as med_fee
      from treatments t
      left join (
        select *
        from use_treatment_medications utm
        join medications m
        on utm.med_id = m.mid
        ) tm
      on tm.start_datetime = t.start_datetime and tm.end_datetime = t.end_datetime and t.doctor_id = tm.doctor_id and tm.inpatient_novem_digit = t.inpatient_novem_digit and tm.inpatient_prefix = t.inpatient_prefix
      where t.inpatient_novem_digit = '#{inpa_novem}';
      "
      inpa2 = "
      select t.start_datetime, t.end_datetime, t.doctor_id, t.inpatient_prefix, t.inpatient_novem_digit, t.result, sum(tm.prescribed_qnt * tm.price) as total_med_fee
      from treatments t
      left join (
        select *
        from use_treatment_medications utm
        join medications m
        on utm.med_id = m.mid
        ) tm
      on tm.start_datetime = t.start_datetime and tm.end_datetime = t.end_datetime and t.doctor_id = tm.doctor_id and tm.inpatient_novem_digit = t.inpatient_novem_digit and tm.inpatient_prefix = t.inpatient_prefix
      where t.inpatient_novem_digit = '#{inpa_novem}'
      group by t.start_datetime, t.end_datetime, t.doctor_id, t.inpatient_prefix, t.inpatient_novem_digit, t.result;
      "
        @inpa_subtotal = ActiveRecord::Base.connection.execute(inpa1)
        @inpa_total = ActiveRecord::Base.connection.execute(inpa2)
        render json: [@inpa_subtotal, @inpa_total]
    end
  end
end
    