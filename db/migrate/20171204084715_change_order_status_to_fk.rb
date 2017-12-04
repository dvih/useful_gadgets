class ChangeOrderStatusToFk < ActiveRecord::Migration[5.1]
  def change
    change_column :Orders, :status, :integer
  end
end
