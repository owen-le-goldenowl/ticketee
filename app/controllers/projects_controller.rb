class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def new

    @project = Project.new
    authorize @project

  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      flash[:notice] = 'Project has been created'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been created'
      render 'new'
    end
  end

  def show

    authorize @project
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    if @project.update(project_params)
      flash[:notice] = 'Project has been updated'
      redirect_to @project
    else
      flash[:alert] = 'Project has not been updated'
      render 'edit'
    end
  end

  def destroy
    authorize @project
    @project.destroy
    flash[:notice] = 'Project has been destroyed'
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The project you were looking for could not be found'
    redirect_to projects_path
  end

end
