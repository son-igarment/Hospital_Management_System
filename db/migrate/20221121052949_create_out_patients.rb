class CreateOutPatients < ActiveRecord::Migration[7.0]
  def change
    create_table :out_patients, id: false do |t|
      t.string :prefix, limit: 3, null: false
      t.string :novem_digit, limit: 9, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :gender, limit: 1, null: false
      t.date :dob, null: false
      t.string :phone_number, null: false
      t.string :address, limit: 100, null: false
    end
    execute "alter table out_patients add primary key (prefix, novem_digit);"
  end
end
