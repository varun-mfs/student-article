class ArticlesController < ApplicationController
  before_action :authenticate_student!, except: [:index, :show]

  def index
    @articles = Article.all
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
    # @article = Article.create(article_params)
    # if @article.valid?
    #   flash[:errors] = 'Article Created Successfully'
    #   redirect_to articles
    #   _path
    # else
    #   flash[:errors] = @article.errors.full_messages
    #   render :new
    # end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private 
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
