class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # I Should Never Call Ex Upon Drinking
  def index
    @articles = Article.all
  end

  def show
    # First calls set_article that sets an instance variable
  end

  def new
    @article = Article.new # It's NOT used to create a article
                                 # It's used to load the form!
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content) #=> ActionController::Parameters
  end
end
