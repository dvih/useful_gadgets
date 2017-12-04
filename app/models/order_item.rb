class OrderItem < ApplicationRecord
  belongs_to :order
  has_many :products

  validates :quantity, :product_id, :order_id, presence:true

  validates :quantity, :numericality => {:only_integer => true}
end
