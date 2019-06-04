class LikesController < ApplicationController

  def create
    Like.create(copy_id: params[:copy_id], user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    # binding.pry
    like = Like.find(params[:id])
    like.destroy if like.user_id == current_user.id
    redirect_to root_path
  end

  private

  def like_params
    params.permit(:copy_id)
  end
  
end
