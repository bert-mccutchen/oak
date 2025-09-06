class CreateIconVariants < ActiveRecord::Migration[8.0]
  def change
    create_table :icon_variants do |t|
      t.references :icon, null: false, foreign_key: true
      t.integer :format, null: false
      t.integer :theme, null: false
      t.timestamps
    end

    add_index :icon_variants, %i[icon_id format theme], unique: true
  end
end
