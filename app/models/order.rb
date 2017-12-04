class Order < ApplicationRecord
    has_many :order_items

    validates :status, :customer_id, presence:true
    validates :status, with: /^[A-Za-z]+$/
end
