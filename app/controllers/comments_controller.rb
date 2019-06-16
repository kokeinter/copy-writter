class CommentsController < ApplicationController
  before_action :comment_params,only:[:create]

  def create
    # binding.pry
    @comment = Comment.create(text: comment_params[:text], copy_id: params[:copy_id], user_id: current_user.id)
    # redirect_back(fallback_location: root_path)
    copy = Copy.find_by(id: params[:copy_id])
    odai_id = copy.odai_id
    respond_to do |format|
      format.html { redirect_to odai_copy_comments_path(odai_id,params[:copy_id])  }
      format.json
    end

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
