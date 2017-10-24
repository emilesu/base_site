class Account::ProjectsController < ApplicationController
  before_action :authenticate_user!

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to account_projects_path
    else
      render :new
    end
  end

# --------
  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

end
