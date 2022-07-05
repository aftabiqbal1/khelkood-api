class Product < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  has_many :product_reviews
  belongs_to :store
  belongs_to :discount
end
