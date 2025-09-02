class CreateQuotes < ActiveRecord::Migration[8.0]
  def change
    create_table :quotes do |t|
      t.string :token, null: false
      t.text :quote, null: false
      t.string :author, null: false
      t.integer :position

      t.timestamps
    end

    add_index :quotes, :token, unique: true
  end
end
