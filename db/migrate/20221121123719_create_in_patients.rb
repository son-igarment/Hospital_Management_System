class CreateInPatients < ActiveRecord::Migration[7.0]
  def change
    create_table :in_patients, id: false do |t|
      t.string :prefix, limit: 3, null: false
      t.string :novem_digit, limit: 9, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender, limit: 1, null: false
      t.date :dob, null: false
      t.string :phone_number, limit: 13, null: false
      t.string :address, limit: 100, null: false
      t.date :date_of_admission, null: false
      t.string :sickroom, null: false, limit: 10
      t.decimal :fee, precision: 13, scale: 2, null: false
      t.integer :nurse_id, null: false
    end
    execute "alter table in_patients add primary key (prefix, novem_digit);"
  end
end