class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments, id: false do |t|
      t.primary_key :did
      t.string :title, null: false
      t.integer :dean_id
    end
  end
end
