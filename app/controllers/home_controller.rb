class HomeController < ApplicationController
  def index
    if !current_user.nil? && current_user.role == 0
      redirect_to customer_dashboard_path
    elsif !current_user.nil? && current_user.role == 1
      redirect_to sports_partner_dashboard_path
    elsif !current_user.nil? && current_user.role == 2
      redirect_to admin_dashboard_path
    else
      root_path
    end
  end
end
