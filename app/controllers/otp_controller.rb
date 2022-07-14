class OtpController < ApplicationController
  def create
    user = User.new(phone_params)
    otp = SecureRandom.random_number(999999)
    user.otp = otp

    if user.save
    render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def sign_in
    user = User.where(otp: otp_params[:otp], mobile_number: otp_params[:mobile_number])
    if user
      render json: user, status: :ok
    else
      render json: user.errors, status: :not_found
    end
  end

  protected

  def phone_params
    params.permit(:mobile_number, :email, :password_confirmation, :password)
  end

  def otp_params
    params.permit(:otp, :mobile_number)
  end
end
