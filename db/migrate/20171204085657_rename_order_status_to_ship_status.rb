class RenameOrderStatusToShipStatus < ActiveRecord::Migration[5.1]
  def change
    rename_table :order_statuses, :ship_statuses
  end
end
