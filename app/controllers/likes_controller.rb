class LikesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    current_user.like(@article)
    redirect_back fallback_location: root_path
  end

  def destroy
    @article = Like.find(params[:id]).article
    current_user.unlike(@article)
    redirect_back fallback_location: root_path
  end
end
