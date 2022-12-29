class LikesController < ApplicationController
  before_action :authenticate_user!

  def new
    @like = Like.new
  end

  def create
    @article = Article.find(params[:article_id])
    @like = @article.likes.create
    @like.user_id = current_user.id
    @like.save
    redirect_to article_path(@article)
  end

end
