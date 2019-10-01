class TasksController < ApplicationController
  before_action :require_login
  before_action :set_task, only: [:edit, :update, :destroy, :complete]

  def index
    # gives the user id display. Checks the user params for the ID associated with login user. Displays the users tasks
        @user = User.find(params[:user_id])
        @tasks = @user.tasks
  end

  def new
    if params[:user_id]
      @user = User.find(params[:user_id])
      @task = Task.new(user_id: @user.id)
    else
      @user = nil
      @task = Task.new
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
       redirect_to projects_path
    
    end
  end

  def edit
    #@task = Task.find(params[:id])
  end

  def update
    if @task.update(task_params)
      redirect_to projects_path
    #else
      #render :edit
    end
  end

  def complete
    @task.update(completed: true)
    redirect_to projects_path
  end

  def destroy
    @task.destroy
    if @task.destroy
      flash[:success] = "Task was deleted."
    else
      flash[:error] = "Task was not deleted"
    end
    redirect_to projects_path
  end


  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:due_date, :description, :user_id, :project_id)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end


end
