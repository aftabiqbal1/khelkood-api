class CustomersController < ApplicationController
  def customer_dashboard
    @customer = current_user
    @top_sports_complex = top_sports_complex
    @top_teams = top_teams
  end

  def find_sports_complex
    search = SportsComplex.where(city: sports_complex_params.city, ground_type:sports_complex_params.ground_type)
    if search
      render json: search, status: :found
    else
      render json: search, status: 404 #not_found
    end
  end

  def top_sports_complex
    #@search = SportsComplexReview.where("rating >=":4.4).joins(SportsComplex)
    search = SportsComplex.joins(:sports_complex_reviews).where("rating >=":4.4)
    if search
      render json: search, status: :found
    else
      render json: SportsComplex.all, status: :found
    end
  end

  def top_teams
    search = Team.order('win_ratio DESC')
    if search
      render json: search, status: :found
    else
      render json: search.errors, status: :unprocessable_entity
    end
  end

  def show

  end

  def customer_dashboard
    top_sports_complex
  end

  private

  # def sports_complex_params
  #   params.require(:sports_complex).permit(:ground_type, :city, :address,{booking: :date,booking: :time_slot})
  # end

end
