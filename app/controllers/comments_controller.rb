class CommentsController < ApplicationController
  before_action :require_login, only: %i[create edit update destroy]
  before_action :set_comment, only: %i[edit update destroy]
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_back fallback_location: root_path, success: 'コメントを投稿しました'
    else
      redirect_back fallback_location: root_path, danger: 'コメントを入力してください'
    end
  end

  def edit
    @article = @comment.article
  end

  def update
    if @comment.update(comment_update_params)
      redirect_to article_path(@comment.article), success: 'コメントを投稿しました'
    else
      redirect_to article_path(@comment.article), danger: 'コメントを入力してください'
    end
  end

  def destroy
    article = @comment.article
    @comment.destroy!
    redirect_to article_path(article)
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body).merge(article_id: params[:article_id])
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
