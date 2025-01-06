class CreateInPatientDiagnoses < ActiveRecord::Migration[7.0]
  def change
    create_table :in_patient_diagnoses, id: false do |t|
      t.string :prefix, limit: 3, null: false
      t.string :novem_digit, limit:9, null: false
      t.string :diagnosis, limit: 300, null: false
    end
    execute "alter table in_patient_diagnoses add primary key (prefix, novem_digit, diagnosis);"
  end
end
