class AddEnabledFlagToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :enabled, :boolean, null: false, default: 1
  end
end
