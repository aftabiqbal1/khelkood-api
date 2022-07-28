class SportsComplex < ApplicationRecord


  has_many :bookings
  has_many :users, through: :bookings
  has_many :sports_complex_reviews
  belongs_to :sports_partner_user, class_name: 'User', foreign_key: 'user_id'


  def self.create_user_for_google(access_token)
    data = access_token.info
    user = SportsComplex.where(email: data.email).first
    unless user
      user = SportsComplex.create(email: data.email,
                         password: Devise.friendly_token[0,20]
      )
    end
    user.name= data.name
    user.provider=access_token.provider
    user.uid=data.email
    user.email=data.email
    user.password_confirmation=user.password
    user.save!
    user
  end
end
