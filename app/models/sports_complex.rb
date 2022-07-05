class SportsComplex < ApplicationRecord
  has_many :bookings
  has_many :users, through: :bookings
  has_many :sports_complex_reviews
  belongs_to :sports_partner_user, class_name: 'User', foreign_key: 'user_id'
end
