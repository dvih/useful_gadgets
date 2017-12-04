class AddPostalToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :postal, :string
  end
end
