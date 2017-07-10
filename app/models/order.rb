class Order < ApplicationRecord
  has_many :order_items
  belongs_to :account

  # validates :status, :total_price, :presence => true
end
