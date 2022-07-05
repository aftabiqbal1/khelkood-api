class OrderDetail < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :transaction_detail
end
