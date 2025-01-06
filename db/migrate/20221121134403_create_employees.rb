class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees, id: false do |t|
      t.primary_key :eid
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :dob, null: false
      t.string :gender, limit: 1
      t.string :address, limit: 100
      t.date :start_date, null: false
      t.string :specialty_name, limit: 50
      t.integer :degree_year
      t.string :job_type, limit: 6, null: false
      t.integer :dept_id, null: false
    end
    # execute "alter table examinations alter column doctor_id type integer using (doctor_id::integer);"
    # execute "alter table examination_diagnoses alter column doctor_id type integer using (doctor_id::integer);"
    # execute "alter table has_next_examinations alter column doctor_id type integer using (doctor_id::integer);"
    # execute "alter table has_next_examinations alter column nxt_exam_doctor_id type integer using (nxt_exam_doctor_id::integer);"
    # rename_column :in_patients, :nurse_unique_code, :nurse_id
    # execute "alter table in_patients alter column nurse_id type integer using (nurse_id::integer);"
    # execute "alter table treatments alter column doctor_id type integer using (doctor_id::integer);"
    
    # execute "alter table examinations alter column doctor_id set not null;"
    # execute "alter table examination_diagnoses alter column doctor_id set not null;"
    # execute "alter table has_next_examinations alter column doctor_id set not null;"
    # execute "alter table has_next_examinations alter column nxt_exam_doctor_id set not null;"
    # execute "alter table in_patients alter column nurse_id set not null;"
    # execute "alter table treatments alter column doctor_id set not null;"
  end
end
