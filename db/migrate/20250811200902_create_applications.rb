class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.references :icon_variant, null: false, foreign_key: true
      t.string :token, null: false
      t.string :name, null: false
      t.string :description
      t.string :url, null: false
      t.integer :position

      t.timestamps
    end

    add_index :applications, :token, unique: true
    add_index :applications, :position
  end
end
