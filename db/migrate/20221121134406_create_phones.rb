class CreatePhones < ActiveRecord::Migration[7.0]
  def change
    create_table :phones, id: false do |t|
      t.integer :owner_id, null: false
      t.string :phone_no, limit: 13, null: false
    end
    execute "alter table phones add primary key (owner_id, phone_no);"
  end
end
