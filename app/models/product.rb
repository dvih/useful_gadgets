class Product < ApplicationRecord
  belongs_to :category

  validates :name, :price, :description, presence:true
end
