class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: "ユーザーの新規作成に成功しました"
    else
      render :new, danger: "ユーザーの作成に失敗しました"
    end
  end

  private  

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
  end
end
