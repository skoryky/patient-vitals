class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :bed
      t.string :mrn

      t.index :mrn, unique: true

      t.timestamps
    end
  end
end
