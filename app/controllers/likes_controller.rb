class LikesController < ApplicationController

  def create
    Like.create(copy_id: params[:copy_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy

    # # binding.pry
    like = Like.find(params[:id])
    like.destroy if like.user_id == current_user.id
    redirect_back(fallback_location: root_path)

    # ajax実装時に使う
    # @like = Like.find_by(params[:id])
    # copy_id = @like.copy_id
    # @copy = Copy.find_by(id: copy_id)
    # odai_id = @copy.odai_id
    # @odai = Odai.find_by(id: odai_id)
    # @like.destroy if @like.user_id == current_user.id
    # respond_to do |format|
    #   format.html
    #   format.json
    # end

  end

  private

  def like_params
    params.permit(:copy_id)
  end
  
end
