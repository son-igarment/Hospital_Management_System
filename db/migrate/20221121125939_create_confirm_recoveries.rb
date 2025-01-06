class CreateConfirmRecoveries < ActiveRecord::Migration[7.0]
  def change
    create_table :confirm_recoveries, id: false do |t|
      t.string :inpatient_prefix, limit: 3, null: false
      t.string :inpatient_novem_digit, limit: 9, null: false
      t.date :discharge_on, null: false
    end
    execute "alter table confirm_recoveries add primary key (inpatient_prefix, inpatient_novem_digit);"
  end
end
