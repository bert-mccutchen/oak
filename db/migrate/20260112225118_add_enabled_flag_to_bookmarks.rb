class AddEnabledFlagToBookmarks < ActiveRecord::Migration[8.0]
  def change
    add_column :bookmarks, :enabled, :boolean, null: false, default: 1
  end
end
