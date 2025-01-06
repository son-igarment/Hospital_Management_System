class GetDoctorPatientsController < ApplicationController
  def index
    doctor_id = params["doctor"]
    inpatients = "
    select in_patients.prefix, in_patients.novem_digit, first_name, last_name, gender, dob, phone_number, address, date_of_admission, sickroom, fee, nurse_id, t.start_datetime, t.end_datetime, t.doctor_id,  t.result 
    from in_patients
    inner join (
      select treatments.start_datetime, treatments.end_datetime, treatments.inpatient_novem_digit, treatments.doctor_id,  result
      from treatments
      where treatments.doctor_id = #{doctor_id}
      ) t
    on in_patients.novem_digit = t.inpatient_novem_digit;

    "
    outpatients = "
    select prefix, novem_digit, first_name, last_name, gender, dob, phone_number, address, 	ae.date_n_time, ae.doctor_id, ae.diagnosis, ae.nxt_exam_datetime, ae.nxt_exam_doctor_id
    from out_patients op
    join (
      select d.date_n_time, d.out_patient_prefix, d.out_patient_novem_digit, d.doctor_id, d.diagnosis, hne.nxt_exam_datetime, hne.nxt_exam_doctor_id
      from (
        select e.date_n_time, e.doctor_id, e.out_patient_prefix, e.out_patient_novem_digit, e.fee, ed.diagnosis
        from examinations e
        inner join examination_diagnoses ed
        on e.out_patient_novem_digit = ed.out_patient_novem_digit and e.date_n_time = ed.date_n_time and e.doctor_id = 				ed.doctor_id
        where e.doctor_id = #{doctor_id}
      ) d
      left join has_next_examinations hne
      on d.date_n_time = hne.date_n_time and d.doctor_id = hne.doctor_id and d.out_patient_novem_digit = hne.out_patient_novem_digit
    ) ae
    on ae.out_patient_novem_digit = op.novem_digit;

    "
    @inpatients = Array.new
    @outpatients = Array.new

    inpatients_arr = ActiveRecord::Base.connection.execute(inpatients).values
    inpatients_arr.each.with_index do |e,i|
      @inpatients[i] = Hash.new
      @inpatients[i]["prefix"] = e[0]
      @inpatients[i]["n9_digit"] = e[1]
      @inpatients[i]["fname"] = e[2]
      @inpatients[i]["lname"] = e[3]
      @inpatients[i]["gender"] = e[4]
      @inpatients[i]["dob"] = e[5]
      @inpatients[i]["phone"] = e[6]
      @inpatients[i]["address"] = e[7]
      @inpatients[i]["doa"] = e[8]
      @inpatients[i]["sickroom"] = e[9]
      @inpatients[i]["fee"] = e[10]
      @inpatients[i]["nurse_id"] = e[11]
      @inpatients[i]["start_dt"] = e[12]
      @inpatients[i]["end_dt"] = e[13]
      @inpatients[i]["doctor_id"] = e[14]
      @inpatients[i]["result"] = e[15]
    end
    # @inpatients = @inpatients.to_json

    outpatients_arr = ActiveRecord::Base.connection.execute(outpatients).values
    outpatients_arr.each.with_index do |e,i|
      @outpatients[i] = Hash.new
      @outpatients[i]["prefix"] = e[0]
      @outpatients[i]["n9_digit"] = e[1]
      @outpatients[i]["fname"] = e[2]
      @outpatients[i]["lname"] = e[3]
      @outpatients[i]["gender"] = e[4]
      @outpatients[i]["dob"] = e[5]
      @outpatients[i]["phone"] = e[6]
      @outpatients[i]["address"] = e[7]
      @outpatients[i]["date_n_time"] = e[8]
      @outpatients[i]["doctor_id"] = e[9]
      @outpatients[i]["diagnosis"] = e[10]
      @outpatients[i]["nxt_exam_dt"] = e[11]
      @outpatients[i]["nxt_exam_doctor_id"] = e[12]
    end
    # @outpatients = @outpatients.to_json
    @return_obj = @inpatients + @outpatients
    # render json: @inpatients
    render json: @return_obj
  end
end
    



