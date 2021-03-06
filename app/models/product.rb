class Product < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates :name, :price, :description, presence:true
  validates :name, :format => { :with => /\A[A-Za-z0-9\/\.\s]+\z/ }

  # Maximum of 2 decimal places.
  # Adapted from https://stackoverflow.com/a/38517312/5952715
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
