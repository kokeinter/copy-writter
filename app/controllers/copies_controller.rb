class CopiesController < ApplicationController
  before_action :copy_params,only:[:create]

  def index
    @copies = Copy.order("created_at DESC")
  end

  def new
    # binding.pry
    @copy = Copy.new
    @odai = Odai.find(params[:odai_id])
  end

  def create
    
    Copy.create(catchphrase: copy_params[:catchphrase], image: copy_params[:image], presentation: copy_params[:presentation], odai_id: params[:odai_id], user_id: current_user.id)
    # binding.pry
    # @copy = Copy.new(copy_params)
    redirect_to root_path

  end

  def destroy
    # binding.pry
    copy = Copy.find(params[:id])
    copy.destroy if copy.user_id == current_user.id
    redirect_to "/users/#{current_user.id}"
  end

  def edit
    @copy = Copy.find(params[:id])
    # binding.pry id=2
  end

  def update
    copy = Copy.find(params[:id])
    if copy.user_id == current_user.id
      copy.update(copy_params)
    end
    redirect_to "/"
  end

  def show
    @copy = Copy.find(params[:id])
    @odai = Odai.find(@copy.odai_id)
    @comments = @copy.comments.includes(:user).order("created_at DESC")
    @comment = Comment.new
  end

  private

  def copy_params
    # binding.pry
    # params.permit(:catchphrase,:image,:presentation)
    params.require(:copy).permit(:catchphrase,:image,:presentation,:odai_id)
    # binding.pry
  end

end
