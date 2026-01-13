class AddCategoriesOrderSetting < ActiveRecord::Migration[8.0]
  def up
    Setting.find_or_initialize_by(slug: "categories_order").update!(
      name: "Categories Order",
      description: "The order of categories.",
      default: "position",
      value_type: :string
    )
  end


  def down
    Setting.find_by(slug: "categories_order")&.destroy
  end
end
