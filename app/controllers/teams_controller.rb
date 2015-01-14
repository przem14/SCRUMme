class TeamsController < ApplicationController
  before_action :require_login

  def index
  end

  def show
  end

  def new
  end

  def create
    @team = Team.new(team_params)

    if @team.save()
      redirect_to @team
    else
      render 'new'
    end
  end

private
  def require_login
    unless user_signed_in?
      flash[:alert] = "You must be logged in"
      redirect_to new_user_session_path
    end
  end

  def team_params
    params.require(:team).permit(:name)
  end
end
