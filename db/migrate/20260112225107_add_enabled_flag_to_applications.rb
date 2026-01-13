class AddEnabledFlagToApplications < ActiveRecord::Migration[8.0]
  def change
    add_column :applications, :enabled, :boolean, null: false, default: 1
  end
end
