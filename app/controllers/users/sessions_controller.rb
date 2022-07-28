# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end
  def login
    user = User.where(mobile_number: sigin_params[:mobile_number])
    if !user.empty?
      user.update(otp: loop do
        generated_otp =rand(1e5...1e6).to_i
        break generated_otp unless User.where(otp:generated_otp).exists?
      end)
      render json: user.to_json( only: [:otp]), status: :ok
    else
      render json: user, status: :not_found
    end
  end

  def verify_mobile_signin
    check = User.where(mobile_number: verify_mobile_signin_params[:mobile_number], otp: verify_mobile_signin_params[:otp])
    if !check.empty?
      render json: check.to_json, status: :ok
    else
      render json: check.to_json, status: :not_found
    end
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def sigin_params
    params.permit(:mobile_number)
  end
  def verify_mobile_signin_params
    params.permit(:otp, :mobile_number)
  end
end
