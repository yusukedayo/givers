class TopicsController < ApplicationController
  def index
    @articles = Article.all.includes(:user).order(created_at: :desc)
  end

  def introduction
     @introduction_articles = Article.tagged_with(["入門編", "入門"], :any => true).includes(:user).order(created_at: :desc)
  end

  def basis
    @basis_articles = Article.tagged_with(["基礎編", "基礎"], :any => true).includes(:user).order(created_at: :desc)
  end

  def advance
    @advance_articles = Article.tagged_with(["応用編", "応用"], :any => true).includes(:user).order(created_at: :desc)
  end

  def advance
    @advance_articles = Article.tagged_with(["応用編", "応用"], :any => true).includes(:user).order(created_at: :desc)
  end

end
