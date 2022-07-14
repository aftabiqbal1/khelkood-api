class OtpMailer < ApplicationMailer
  def otp_send
    otp = SecureRandom.random_number(1000)
    @user = params[:user]
    mail(to: @user.email, subject: "OTP: #{otp}")
  end
end
