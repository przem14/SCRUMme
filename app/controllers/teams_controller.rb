class TeamsController < ApplicationController
  before_action :require_login
  before_action :require_admin, only: [:index]

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new(team_params)
    @user = User.find(params[:team][:user_id])
    @user.teams << @team

    @team.board = Board.new

    if @team.save && @user.save
      redirect_to @team
    else
      render 'new'
    end
  end

  def update
    @team = Team.find(params[:id])
    @team.users += params[:team][:users][1..-1].map{|id| User.find(id)}

    if @team.update(team_params)
      redirect_to @team
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path
  end

  def new_member
    @team = Team.find(params[:id])

    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

private
  def team_params
    params.require(:team).permit(:name)
  end
end
