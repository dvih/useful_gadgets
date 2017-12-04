class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true
  validates :name, with: /^[A-Za-z]+$/
end
