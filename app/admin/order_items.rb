ActiveAdmin.register OrderItem do
  permit_params :quantity, :product_id, :order_id
end
