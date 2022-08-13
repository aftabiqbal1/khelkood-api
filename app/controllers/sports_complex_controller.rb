class SportsComplexController < ApplicationController
  def create
    if !current_user.nil?
      sports_complex = SportsComplex.new(sports_complex_params)
      sports_complex.user_id = current_user.id
      if sports_complex.save
        render json: sports_complex, status: :created
      else
        render json: sports_complex.errors, status: :unprocessable_entity
      end
    else
      root_path
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  def post_review
    review = SportsComplexReview.new(sports_complex_review_params)
    if review.save
      render json: review, status: :created
    else
      render json: review.errors, status: :unprocessable_entity
    end
  end

  private
  def sports_complex_params
    params.require(:sports_complex).permit(:name, :image, :city, :address, :cost_hr, :timing, :snacks_availability, :ground_type, :no_of_stadiums)
  end

  def sports_complex_review_params
    params.require(:sports_complex_review)
  end
end
