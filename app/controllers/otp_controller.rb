class OtpController < ApplicationController
  def create
    @otp = Otp.new(phone_params)
    if @otp.save
    render json: @otp, only: [:otp], status: :created
    else
      render json: @otp.errors, each_serializer: OtpSerializer, status: :unprocessable_entity
    end
  end

  def verify
    check = Otp.where(otp: otp_params[:otp], mobile_number: otp_params[:mobile_number])
    if !check.empty?
      check.update(verified:true)
      User.create(mobile_number: otp_params[:mobile_number])
      render json: check, status: :ok
    else
      render json: check, status: :not_found
    end
  end

  protected

  def phone_params
    params.permit(:mobile_number)
  end

  def otp_params
    params.permit(:otp, :mobile_number)
  end
end
