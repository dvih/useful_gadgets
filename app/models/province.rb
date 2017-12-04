class Province < ApplicationRecord
  has_many :customers

  validates :name, :gst_rate, :pst_rate, :hst_rate, presence:true
end
