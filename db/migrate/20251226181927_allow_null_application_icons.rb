class AllowNullApplicationIcons < ActiveRecord::Migration[8.0]
  def change
    change_column_null :applications, :icon_id, true
  end
end
