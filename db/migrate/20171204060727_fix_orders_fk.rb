class FixOrdersFk < ActiveRecord::Migration[5.1]
  def change
    rename_column :Orders, :user_id, :customer_id
  end
end
