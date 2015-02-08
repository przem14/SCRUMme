class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :require_admin, only: [:new]

  respond_to :html

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    @users = User.all

    respond_with(@task)
  end

  def new_in_sprint
    @task = Task.new
    @sprint = Sprint.find(params[:id])
    @users = @sprint.board.team.users

    respond_with(@task)
  end

  def edit
    @task = Task.find(params[:id])
    @sprint = @task.sprint
    @users = @sprint.board.team.users
  end

  def create
    @task = Task.new(task_params)
    @sprint = @task.sprint
    @users = @sprint.board.team.users

    @task.remaining_time = @task.estimate if @task.remaining_time.nil?
    @task.logged_time = 0

    @task.save
    respond_with(@task)
  end

  def update
    unless params[:time].nil?
      @task.remaining_time -= params[:time].to_i
      @task.logged_time += params[:time].to_i
    end

    @task.remaining_time = 0 if @task.remaining_time < 0
    @task.update(task_params)
    if params[:time].nil?
      respond_with(@task)
    else
      redirect_to :back
    end
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:sprint_id, :user_id, :title, :description, :estimate, :remaining_time)
    end
end
