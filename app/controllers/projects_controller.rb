class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
    render :new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path, notice: 'Success'
    else
      render :new, alert: 'Error'
    end
  end

  def update
    if @project.update(project_params)
      redirect_to :root, notice: 'Project updated.'
    else
      render :new, alert: 'Error updating project'
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :goal_in_cents, :progress_in_cents)
  end
end
