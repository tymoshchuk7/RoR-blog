class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    @comment.commenter = current_user.email
    @comment.save
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
