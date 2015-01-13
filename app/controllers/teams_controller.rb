class TeamsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @team = Team.new(team_params)

    @team.save()
    redirect_to @team
  end

private
  def team_params
    params.require(:team).permit(:name)
  end
end
