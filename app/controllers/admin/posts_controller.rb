class Admin::PostsController < AdminController

  def new
    @project = Project.find(params[:project_id])
    @post = Post.new
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def create
    @project = Project.find(params[:project_id])
    @post = Post.new(post_params)
    @post.project_id = @project.id
    @post.user_id = current_user.id

    if @post.save
      redirect_to admin_project_path(@project)
    else
      redirect_to admin_project_path(@project)
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to admin_project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_project_path(@project)
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :project_id)
  end
end
