class CopiesController < ApplicationController
  before_action :copy_params,only:[:create]

  def index
    @copies = Copy.order("created_at DESC")
  end

  def new
    @copy = Copy.new
  end

  def create
    
    Copy.create(catchphrase: copy_params[:catchphrase], image: copy_params[:image], presentation: copy_params[:presentation], odai_id: params[:odai_id], user_id: current_user.id)
    # binding.pry
    # @copy = Copy.new(copy_params)
    redirect_to root_path

  end

  private

  def copy_params
    # binding.pry
    # params.permit(:catchphrase,:image,:presentation)
    params.require(:copy).permit(:catchphrase,:image,:presentation,:odai_id)
    # binding.pry
  end

end
