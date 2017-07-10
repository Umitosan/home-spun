class Product < ApplicationRecord
  has_many :order_items
  has_many :comments

  validates :name, :description, :price, :image_url, :presence => true
end
