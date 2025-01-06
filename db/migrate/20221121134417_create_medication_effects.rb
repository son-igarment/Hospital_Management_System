class CreateMedicationEffects < ActiveRecord::Migration[7.0]
  def change
    create_table :medication_effects, id: false do |t|
      t.integer :med_id, null: false
      t.string :effect, null: false
    end
    execute "alter table medication_effects add primary key (med_id, effect);"
  end
end
