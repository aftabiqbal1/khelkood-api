class TransactionDetail < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  belongs_to :order_detail
end
