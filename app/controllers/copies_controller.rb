class CopiesController < ApplicationController
  def index
    @copies = Copy.order("created_at DESC")
  end

  def new
    @copy = Copy.new
  end

  def create
    @copy = Copy.create(catchphrase: copy_params[:catchphrase],odai_id: copy_params[:odai_id])
    redirect_to root_path
  end

  private

  def copy_params
    # binding.pry
    params.require(:copy).permit(:catchphrase,:odai_id)
  end

end
