class ChangeOrderStatusToFkPartFour < ActiveRecord::Migration[5.1]
  def change
    rename_table :ship_statuses, :order_statuses
  end
end
