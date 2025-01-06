class CreateProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :providers, id: false do |t|
      t.primary_key :pid
      t.string :name, null: false
      t.string :phone_no, limit: 15, null: false
      t.string :address, limit: 100, null: false
    end
  end
end
