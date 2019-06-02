class CommentsController < ApplicationController
  before_action :comment_params,only:[:create]

  def create
    # binding.pry
    Comment.create(text: comment_params[:text], copy_id: params[:copy_id], user_id: current_user.id)
    redirect_to root_path
  end

  private

  def comment_params
    # binding.pry
    params.require(:comment).permit(:text,:copy_id)
    # binding.pry
  end

end
