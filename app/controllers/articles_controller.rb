class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def edit
    @article = find_article
  end

  def create 
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = find_article

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy 
    @article = find_article
    @article.destroy

    redirect_to articles_path
  end

  def index
    @articles = Article.all
  end

  def show
    @article = find_article
  end

  private
    def article_params
      params.require(:article).permit(:title,:text)
    end

    def find_article
      Article.find(params[:id])
    end

end
