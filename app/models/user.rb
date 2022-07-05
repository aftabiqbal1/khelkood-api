# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  enum :role, {admin: 0, sports_partner: 1, user: 2}, default:2

  #relationships
  has_many :bookings
  has_many :sports_complexes, through: :bookings
  has_many :sports_complexes
  has_many :order_details
  has_many :product_reviews
  has_many :stores
  has_many :transaction_details
  belongs_to :team, optional: true
end
