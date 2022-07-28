class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # , omniauthable, omniauth_providers: [:google_oauth2]
  enum :role, {admin: 0, sports_partner: 1, user: 2}, default:2


  validates :mobile_number,
            uniqueness: true,
            presence: false,
            numericality: true,
            length: { :minimum => 10, :maximum => 15 },
            allow_blank: true

  validates_uniqueness_of :email, allow_blank: true, if: :email_required?
                          # conditions: -> {where.not(email: '')}



  #relationships
  has_many :bookings
  has_many :sports_complexes, through: :bookings
  has_many :sports_complexes
  has_many :order_details
  has_many :product_reviews
  has_many :stores
  has_many :transaction_details
  belongs_to :team, optional: true

  protected
  #override devise defaults
  def email_required?
    false
  end
  def password_required?
    false
  end
end
