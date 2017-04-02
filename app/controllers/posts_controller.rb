class PostsController < ApplicationController
  

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new

  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group),notice:"Created post!"
    else
      render :new
    end

  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
  end

private
  def post_params
    params.require(:post).permit(:content)
  end

end
