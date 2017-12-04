class ChangeOrderStatusToFkPartTwo < ActiveRecord::Migration[5.1]
  def change
    rename_column :Orders, :status, :status_id
  end
end
