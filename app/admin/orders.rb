ActiveAdmin.register Order do
  permit_params :status, :customer_id
end
