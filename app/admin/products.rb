ActiveAdmin.register Product do
  permit_params :name, :price, :image, :description, :category_id
end
