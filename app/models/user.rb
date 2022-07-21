# frozen_string_literal: true

class User < ActiveRecord::Base
  # extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, :confirmable
  # include DeviseTokenAuth::Concerns::User

  enum :role, {admin: 0, sports_partner: 1, user: 2}, default:2

  validates :mobile_number,
            uniqueness: true,
            :presence => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }
  # validates :phone_number_or_email_is_present


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

  attr_writer :login

  def login
    @login || self.mobile_number || self.email
  end

  def email_required?
    false
  end

  # def phone_number_or_email_is_present
  #   if self.mobile_number.blank? && self.email.blank?
  #     errors.add(:base, "Email or mobile number must be set")
  #   end
  # end
  #


end
