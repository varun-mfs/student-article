class CommentsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.student = current_student
    if @comment.save
      redirect_to article_path(@article)
    else 
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy!
      flash[:errors] = 'Comment Deleted Successfully'
      redirect_to article_path(params[:article_id])
    else
      flash[:errors] = @article.errors.full_messages
      redirect_to destroy_article_path
    end
  end

  private 
    def comment_params
      params.require(:comment).permit(:body)
    end
end
