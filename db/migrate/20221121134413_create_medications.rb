class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications, id: false do |t|
      t.primary_key :mid
      t.string :name, null: false
      t.decimal :price, precision: 11, scale: 2, null: false
      t.date :expiration_date, null: false
      t.integer :quantity, null: false
      t.datetime :imported_datetime, null: false
      t.decimal :imported_price, precision: 11, scale: 2, null: false
      t.integer :provider_no, null: false
    end
  end
end