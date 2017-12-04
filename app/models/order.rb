class Order < ApplicationRecord
    has_many :order_items

    validates :status, :customer_id, presence:true
    validates :status, :format => { :with => /\A[A-Za-z0-9-\/\.\s]+\z/ }
end
