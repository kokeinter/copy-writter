class AppliesController < ApplicationController
  before_action :apply_params,only:[:create]

  def create
    Apply.create(recruit_id: params[:recruit_id],user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end


  private
  def apply_params
    # binding.pry
    params.permit(:recruit_id)
  end


end
