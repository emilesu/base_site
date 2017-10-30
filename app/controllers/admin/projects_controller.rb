class Admin::ProjectsController < AdminController

  def index
    @projects = Project.all.order("created_at DESC")
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to admin_projects_path
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to admin_projects_path
  end

  # --------
  private

  def project_params
    params.require(:project).permit(:title, :description, :user_id)
  end

end
