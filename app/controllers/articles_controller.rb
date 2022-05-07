class ArticlesController < ApplicationController
  before_action :require_login, only: %i[new create edit update destroy]
  before_action :set_article, only: %i[edit update destroy]
  def index
    @articles = Article.all.includes(:user).order(created_at: :desc).limit(4)
    @introduction_articles = Article.tagged_with(["入門編", "入門"], :any => true).includes(:user).limit(4).order(created_at: :desc)
    @basis_articles = Article.tagged_with(["基礎編", "基礎"], :any => true).includes(:user).limit(4).order(created_at: :desc)
    @advance_articles = Article.tagged_with(["応用編", "応用"], :any => true).includes(:user).limit(4).order(created_at: :desc)
    if params[:tag_name]
      @articles = Article.tagged_with("#{params[:tag_name]}")
    end
  end

  def search
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
    @comments = @article.comments.includes(:user).order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to article_path(@article), success: '投稿を更新しました'
    else
      flash.now[:danger] = '失敗しました'
      render :edit
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to articles_path, success: '投稿しました'
    else
      flash.now[:danger] = '失敗しました'
      render :new
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, success: '質問を削除しました'
  end

  def likes
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true).includes(:user).order(created_at: :desc)
    @like_articles = current_user.like_articles.includes(:user).order(created_at: :desc)
  end

  private

  def article_params
    params.require(:article).permit(:title, :url, :body, :status, :tag_list)
  end

  def set_article
    @article = current_user.articles.find(params[:id])
  end
end
