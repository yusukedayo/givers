class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update show]

  def index
    
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: 'プロフィールを更新しました'
    else
      flash.now[:danger] = '失敗しました'
      render :edit
    end
  end

  def show
    @own_articles = @user.articles
  end

  private

  def set_user
    @user = User.find(current_user.id)
    # @user = current_userだと不正なデータが表示される可能性がある。
  end

  def user_params
    params.require(:user).permit(:email, :user_name, :avatar)
  end
end
