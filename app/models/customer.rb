class Customer < ApplicationRecord
  belongs_to :province
  validates :username, :password, :province_id, presence: true
  validates :username, :format => { :with => /\A[A-Za-z0-9-\/\.\s]+\z/ }
end
