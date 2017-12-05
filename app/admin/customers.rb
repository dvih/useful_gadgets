ActiveAdmin.register Customer do
  permit_params :username, :password, :province_id, :postal, :address, :stripe_id
end
