class Otp < ApplicationRecord
  belongs_to :user, optional: true

  before_save :set_otp

  def set_otp
    self.otp = generate_otp
  end

  def generate_otp
    loop do
      generated_otp =rand(1e5...1e6).to_i
      break generated_otp unless Otp.where(otp:generated_otp).exists?
    end
  end
end
