class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def new
    @project = Project.find(params[:project_id])
    @post = Post.new
  end

  def create
    @project = Project.find(params[:project_id])
    @post = Post.new(post_params)
    @post.project_id = @project.id
    @post.user_id = current_user.id

    if @post.save
      redirect_to account_project_path(@project)
    else
      redirect_to account_project_path(@project)
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :project_id)
  end

end
