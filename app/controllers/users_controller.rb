class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @stayhotels = current_user.stayhotels.all
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    else
      render :show
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to edit_user_path(current_user), alert: "不正なアクセスです。"
    end
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path, notice: "アカウント情報を更新しました。"
    else
      render :edit
    end
  end 
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
