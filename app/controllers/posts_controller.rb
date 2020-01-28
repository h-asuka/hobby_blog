class PostsController < ApplicationController
  def index
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(11).pluck(:post_id))
    @new_posts = Post.limit(11).order(" created_at DESC ")
    if user_signed_in?
      @posts = current_user.posts.includes(:user).order(id: "DESC")
    else
      @posts = Post.includes(:user)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end


  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: current_user.id)
  end

  #ガード節
  # def not_edit_user
  #   if @post.user_id != current_user.id 
  #     flash[:alert] = "該当ユーザーではありません"
  #     redirect_to root_path
  #   end 
  # end

end
