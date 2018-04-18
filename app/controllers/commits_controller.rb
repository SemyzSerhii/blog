class CommitsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end
  def new

  end
  def create
    @comment = Comment.new(params.require(:comment).permit(:name_author,:body))
    @comment.save
    redirect_to @comment
  end
end
