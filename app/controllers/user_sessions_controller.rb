class UserSessionsController < ApplicationController
    def new; end

    def create
      @user = login(params[:email], params[:password])
      if @user
        binding.pry
        redirect_back_or_to root_path, success: "ログインに成功しました"
      else
        render :new, danger: "ログインに失敗しました"
      end
    end

    def destroy
        logout
        redirect_to login_path, success: "ログアウトしました"
    end
end
