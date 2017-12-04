class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true
  validates :name, :format => { :with => /\A[A-Za-z0-9-\/\.\s]+\z/ }
end
