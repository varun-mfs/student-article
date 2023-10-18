class ArticlesController < ApplicationController
  before_action :authenticate_student!, except: [:index, :show]
  before_action :set_article_params, only: %i[show edit update destroy]

  def index
    @articles = Article.all
  end

  def myArticles
    @articles = current_student.articles
    render 'index'
  end

  def new
    @article = current_student.articles.build
  end

  def create
    @article = current_student.articles.build(article_params)
    if @article.save
      redirect_to controller: 'articles', action: 'index'
    else 
      render :new
    end
  end

  def show
  end
  
  

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:errors] = 'Article Updated Successfully'
      redirect_to article_path(@article)
    else
      flash[:errors] = @article.errors.full_messages
      redirect_to edit_article_path
    end
  end

  def destroy
    if @article.delete
      flash[:errors] = 'Article Deleted Successfully'
      redirect_to root_path(@article)
    else
      flash[:errors] = @article.errors.full_messages
      redirect_to destroy_article_path
    end

  end

  private
  def set_article_params
    begin
      @article = Article.find(params[:id])
    rescue
      @error = "No article found!"
    end
  end

  private 
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
