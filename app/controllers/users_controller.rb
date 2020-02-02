class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "編集の保存に失敗しました"
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    @users = @user.followings
    @posts = @user.posts
  end

  def followings
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end

end
