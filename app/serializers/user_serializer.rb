class UserSerializer < ActiveModel::Serializer
  #relationships
  has_many :bookings
  has_many :sports_complexes, through: :bookings
  has_many :sports_complexes
  has_many :order_details
  has_many :product_reviews
  has_many :stores
  has_many :transaction_details
  belongs_to :team, optional: true
  has_many :otps

  attributes :id, :name, :email, :city, :address, :role, :team_id, :otp, :mobile_number
end
