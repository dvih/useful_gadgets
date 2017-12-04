class Customer < ApplicationRecord
  belongs_to :province
  validates :username, :password, :province_id, presence: true
  validates :username, with: /^[A-Za-z]+$/
end
