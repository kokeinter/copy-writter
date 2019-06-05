class CommentsController < ApplicationController
  before_action :comment_params,only:[:create]

  def create
    # binding.pry
    Comment.create(text: comment_params[:text], copy_id: params[:copy_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    # binding.pry
    params.require(:comment).permit(:text,:copy_id)
    # binding.pry
  end

end
