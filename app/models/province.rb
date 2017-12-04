class Province < ApplicationRecord
  has_many :customers

  validates :name, :gst_rate, :pst_rate, :hst_rate, presence:true
  validates :name, :format => { :with => /\A[A-Za-z0-9\/\.\s]+\z/ }

  # Maximum of 2 decimal places.
  # Adapted from https://stackoverflow.com/a/38517312/5952715
  validates :gst_rate, :pst_rate, :hst_rate, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
end
