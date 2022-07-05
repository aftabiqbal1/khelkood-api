class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :sports_complex_reviews
end
