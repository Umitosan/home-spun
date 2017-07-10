class Account < ApplicationRecord
  has_many :orders
  has_one :user
end
