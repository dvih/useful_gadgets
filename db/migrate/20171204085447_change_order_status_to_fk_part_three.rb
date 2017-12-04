class ChangeOrderStatusToFkPartThree < ActiveRecord::Migration[5.1]
  def change
    rename_column :Orders, :status_id, :order_status_id
  end
end
