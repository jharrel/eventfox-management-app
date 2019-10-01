class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  
  def index
      @projects = Project.all
  end

  def show
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
<<<<<<< HEAD
=======
    #@project = Project.find(params[:id])
>>>>>>> 58d4f89ff31e7f1dfb4d979de4fca86518984a15
    @project.destroy
    redirect_to projects_path
  end

  private

  def set_project
    #instance of project is created by finding the project in params :id which is the unique ID for this project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require('project').permit(:name)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
