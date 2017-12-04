class OrderStatus < ApplicationRecord
  has_many :orders

  validates :name, presence: true
  validates :name,
    :inclusion  => { :in => [ 'Paid', 'Shipped' ],
    :message    => "%{value} is not a valid order status" }
end
