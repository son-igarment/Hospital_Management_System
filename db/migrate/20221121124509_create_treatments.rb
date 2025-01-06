class CreateTreatments < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments, id: false do |t|
      t.datetime :start_datetime, null: false
      t.datetime :end_datetime, null: false
      t.integer :doctor_id, null: false
      t.string :inpatient_prefix, limit: 3, null: false
      t.string :inpatient_novem_digit, limit: 9, null: false
      t.text :result, null: false
    end
    execute "alter table treatments add primary key (start_datetime, end_datetime, doctor_id, inpatient_prefix, inpatient_novem_digit);"
  end
end