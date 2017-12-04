class Order < ApplicationRecord
    belongs_to :order_status, optional: true
    has_many :order_items

    validates :customer_id, presence:true
end
