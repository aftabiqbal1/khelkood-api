class TeamsController < ApplicationController
  def create
    @team = Team.new(team_params)
    if @team.save
      @user = User.find(current_user.id)
      @user.update(team_id: @team.id)
      @user.save
      render json: @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def add_match_stats
    binding.break
    @stats = Team.find(match_stats_params[:id])

    if !@stats.nil?

    end
  end

  def win_match

  end

  def lose_match

  end

  def draw_match

  end

  private
  def team_params
    params.require(:team).permit(:name)
  end

  def match_stats_params
    params.require(:team).permit(:id, :result)
  end
end
