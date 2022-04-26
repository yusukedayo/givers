class ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    article = Article.find(params[:id])
    article.update!(article_params)
    redirect_to articles_url
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to articles_url
  end

private


def article_params
  params.require(:article).permit(:title, :url, :body, :status)
end
end
