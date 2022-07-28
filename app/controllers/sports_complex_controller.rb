class SportsComplexController < ApplicationController
  def create
    @user = current_user

  end

  protected

  def sports_complex_params

  end
end
