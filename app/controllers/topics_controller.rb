class TopicsController < ApplicationController
  def index
    @articles = Article.all.includes(:user).order(created_at: :desc)
  end

  def introduction
     @introduction_articles = Article.tagged_with(["入門"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def basis
    @basis_articles = Article.tagged_with(["基礎"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def advance
    @advance_articles = Article.tagged_with(["応用"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def advance
    @advance_articles = Article.tagged_with(["応用"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def error
    @error_articles = Article.tagged_with(["エラー"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def function
    @function_articles = Article.tagged_with(["機能"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def design
    @design_articles = Article.tagged_with(["デザイン"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def rails
    @rails_articles = Article.tagged_with(["ails"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def how_to_study
    @how_to_study_articles = Article.tagged_with(["学習"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def life_hack
    @life_hack_articles = Article.tagged_with(["ライフハック"], :wild => true).includes(:user).order(created_at: :desc)
  end

  def event
    @event_articles = Article.tagged_with(["イベント"], :wild => true).includes(:user).order(created_at: :desc)
  end

end
