class CreateVitalsReadings < ActiveRecord::Migration
  def change
    create_table :vitals_readings do |t|
      t.integer :patient_id

      t.decimal :bp_diastolic, precision: 3
      t.decimal :bp_systolic, precision: 3
      t.decimal :heart_rate, precision: 3
      t.decimal :respiratory_rate, precision: 2
      t.decimal :temperature_celsius, precision: 3, scale: 1

      t.timestamps
    end
    add_index :vitals_readings, [:patient_id, :created_at]
  end
end
