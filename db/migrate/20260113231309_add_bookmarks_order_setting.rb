class AddBookmarksOrderSetting < ActiveRecord::Migration[8.0]
  def up
    Setting.find_or_initialize_by(slug: "bookmarks_order").update!(
      name: "Bookmarks Order",
      description: "The order of bookmarks.",
      default: "position",
      value_type: :string
    )
  end


  def down
    Setting.find_by(slug: "bookmarks_order")&.destroy
  end
end
