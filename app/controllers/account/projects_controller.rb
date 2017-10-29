class Account::ProjectsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @projects = Project.where(:user_id => current_user.id).order("created_at DESC")
  end

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

  def show
    @project = Project.find(params[:id])
    @post = Post.new
    # @posts = @project.posts.order("created_at DESC")
  end

# --------
  private

  def project_params
    params.require(:project).permit(:title, :description, :user_id)
  end

end
