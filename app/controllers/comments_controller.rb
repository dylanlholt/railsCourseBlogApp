class CommentsController < ApplicationController
  http_basic_authenticate_with name: "mh", password: "secret",
  only: :destroy
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    
    n = 0
    
    @article.comments.each do |c|
      n = n + 1
    end
    
    @article.update(comments_num: n)
    
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    
    n = 0
    
    @article.comments.each do |c|
      n = n + 1
    end
    
    @article.update(comments_num: n)
    redirect_to article_path(@article)
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end

