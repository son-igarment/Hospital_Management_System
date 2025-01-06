class CreateUseExaminationMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :use_examination_medications, id: false do |t|
      t.datetime :date_n_time, null: false
      t.integer :doctor_id, null: false
      t.string :out_patient_prefix, limit: 3, null: false
      t.string :out_patient_novem_digit, limit: 9, null: false
      t.integer :med_id, null: false
      t.integer :prescribed_qnt, null: false
    end
    execute "alter table use_examination_medications add primary key (date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit, med_id);"
  end
end
