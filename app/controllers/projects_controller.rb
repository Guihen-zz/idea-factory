class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @my_projects = User.find(current_user).projects if user_signed_in?
    @projects = Project.all - (@my_projects || [])
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def new
    @project = Project.new
    respond_with(@project)
  end

  def edit
    set_project
    @project.users << current_user if not @project.users.include? current_user
    @project.save
  end

  def create
    @project = Project.new(project_params)
    @project.users << current_user
    @project.save
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :status, :idea_id)
    end
end
