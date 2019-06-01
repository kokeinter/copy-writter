class OdaisController < ApplicationController
  before_action :odai_params,only:[:create]

  def index
    @odais = Odai.order("created_at DESC")
    # binding.pry
  end

  def new
    @odai = Odai.new
  end

  def create
    Odai.create(image: odai_params[:image], text: odai_params[:text], user_id: current_user.id)
    # binding.pry
    redirect_to odais_path
  end

  def edit
    @odai = Odai.find(params[:id])
  end

  def update
    odai = Odai.find(params[:id])
    if odai.user_id == current_user.id
      odai.update(odai_params)
    end
    redirect_to odais_path
  end

  def destroy
    odai = Odai.find(params[:id])
    odai.destroy if odai.user_id == current_user.id
    redirect_back(fallback_location: odais_path)
  end

  private

  def odai_params
    # binding.pry
    params.require(:odai).permit(:image,:text)
    # binding.pry
  end
end
