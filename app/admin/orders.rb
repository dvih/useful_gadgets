ActiveAdmin.register Order do
  permit_params :name, :order_status_id
end
