class Product < ApplicationRecord
  belongs_to :category
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates :name, :price, :description, presence:true
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
