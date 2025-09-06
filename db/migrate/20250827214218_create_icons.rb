class CreateIcons < ActiveRecord::Migration[8.0]
  def change
    create_table :icons do |t|
      t.string :slug, null: false
      t.string :name, null: false
      t.string :tags

      t.timestamps
    end

    add_index :icons, :slug, unique: true
  end
end
