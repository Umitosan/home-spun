class Order < ApplicationRecord
  belongs_to :account
  has_many :order_items

  validates :status, :total_price, :presence => true
end
