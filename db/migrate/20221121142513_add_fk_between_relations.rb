class AddFkBetweenRelations < ActiveRecord::Migration[7.0]
  def change
    execute "alter table employees add foreign key (dept_id) references departments(did);"
    execute "alter table phones add foreign key (owner_id) references employees(eid);"
    execute "alter table departments add foreign key (dean_id) references employees(eid);"
    execute "alter table examinations add foreign key (doctor_id) references employees(eid);"
    execute "alter table examinations add foreign key (out_patient_prefix, out_patient_novem_digit) references out_patients(prefix, novem_digit);"
    execute "alter table examination_diagnoses add foreign key (date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit) references examinations(date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit);"
    execute "alter table has_next_examinations add foreign key (date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit) references examinations(date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit);"
    execute "alter table has_next_examinations add foreign key (nxt_exam_datetime, nxt_exam_doctor_id, nxt_exam_out_patient_prefix, nxt_exam_out_patient_novem_digit) references examinations(date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit);"
    execute "alter table in_patients add foreign key (nurse_id) references employees(eid);"
    execute "alter table treatments add foreign key (doctor_id) references employees(eid);"
    execute "alter table treatments add foreign key (inpatient_prefix, inpatient_novem_digit) references in_patients(prefix, novem_digit);"
    execute "alter table in_patient_diagnoses add foreign key (prefix, novem_digit) references in_patients(prefix, novem_digit);"
    execute "alter table medications add foreign key (provider_no) references providers(pid);"
    execute "alter table medication_effects add foreign key (med_id) references medications(mid);"
    execute "alter table confirm_recoveries add foreign key (inpatient_prefix, inpatient_novem_digit) references in_patients(prefix, novem_digit);"
    execute "alter table use_examination_medications add foreign key (date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit) references examinations(date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit);"
    execute "alter table use_examination_medications add foreign key (med_id) references medications(mid);"
    execute "alter table use_treatment_medications add foreign key (start_datetime, end_datetime, doctor_id, inpatient_prefix, inpatient_novem_digit) references treatments(start_datetime, end_datetime, doctor_id, inpatient_prefix, inpatient_novem_digit);"
    execute "alter table use_treatment_medications add foreign key (med_id) references medications(mid);"
  end
end
