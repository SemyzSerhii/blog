class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new; end

  def create
    @comment = Comment.create(comment_params)
    redirect_to @comment
  end

  private
  def comment_params
    params.require(:comment).permit(:author_id, :body)
  end

end
