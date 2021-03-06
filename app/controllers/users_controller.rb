class UsersController < ApplicationController
  before_action :move_to_index, except: :index

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
      flash[:success] = 'ユーザー情報を編集しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
      render :edit
    end
  end

  def favorites
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
    @posts = @user.posts
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :image, :password, :password_confirmation)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end 

end
