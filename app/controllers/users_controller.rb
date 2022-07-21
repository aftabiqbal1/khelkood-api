class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.json { render json: @user, only: [:email, :password], status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def signin
    user = User.where(mobile_number: sigin_params[:mobile_number])
    if !user.empty?
      user.update(otp: loop do
        generated_otp =rand(1e5...1e6).to_i
        break generated_otp unless User.where(otp:generated_otp).exists?
      end)
      render json: user, only: [:otp], status: :ok
    else
      render json: user, status: :not_found
    end
  end

  def verify_mobile_signin
    check = User.where(mobile_number: verify_mobile_signin_params[:mobile_number], otp: verify_mobile_signin_params[:otp])
    if !check.empty?
      render json: check, status: :ok
    else
      render json: check, status: :not_found
    end
  end

  private
  def sigin_params
    params.permit(:mobile_number)
  end
  def verify_mobile_signin_params
    params.permit(:otp, :mobile_number)
  end
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :otp, :name, :city, :address, :mobile_number, :active_status)
  end
end
