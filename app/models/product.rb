class Product < ApplicationRecord
  belongs_to :category
  belongs_to :order_item
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates :name, :price, :description, presence:true
  validates :name, with: /^[A-Za-z]+$/

  # Maximum of 2 decimal places.
  # Adapted from https://stackoverflow.com/a/38517312/5952715
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
