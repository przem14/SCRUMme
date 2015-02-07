class SprintsController < ApplicationController
  before_action :set_sprint, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :require_admin, only: [:index]

  respond_to :html

  def index
    @sprints = Sprint.all
    respond_with(@sprints)
  end

  def show
    respond_with(@sprint)
  end

  def new
    @sprint = Sprint.new
    respond_with(@sprint)
  end

  def edit
  end

  def create
    @board = Board.find(sprint_params[:board_id])

    @sprint = Sprint.new(sprint_params)
    @sprint.number = 0
    unless @board.sprints.empty?
      sprint_number = @board.sprints.map{|sprint| sprint.number}.max + 1
      @sprint.number = sprint_number
    end

    @sprint.save
    respond_with @board
  end

  def update
    @sprint.update(sprint_params)
    respond_with(@sprint)
  end

  def destroy
    @sprint.destroy
    respond_with(@sprint)
  end

  private
    def set_sprint
      @sprint = Sprint.find(params[:id])
    end

    def sprint_params
      params.require(:sprint).permit(:board_id)
    end
end
