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
    @post.project = @project
    @post.user = current_user

    if @post.save
      redirect_to account_project_path(@project)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
