class AddApplicationsOrderSetting < ActiveRecord::Migration[8.0]
  def up
    Setting.find_or_initialize_by(slug: "applications_order").update!(
      name: "Applications Order",
      description: "The order of applications.",
      default: "position",
      value_type: :string
    )
  end


  def down
    Setting.find_by(slug: "applications_order")&.destroy
  end
end
