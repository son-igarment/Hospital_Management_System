class CreateExaminations < ActiveRecord::Migration[7.0]
  def change
    create_table :examinations, id: false do |t|
      t.datetime :date_n_time, null: false
      t.integer :doctor_id, null: false
      t.string :out_patient_prefix, limit: 3, null: false
      t.string :out_patient_novem_digit, limit: 9, null: false
      t.decimal :fee, precision: 13, scale: 2, null: false
    end
    execute "alter table examinations add primary key (date_n_time, doctor_id, out_patient_prefix, out_patient_novem_digit);"
  end
end
