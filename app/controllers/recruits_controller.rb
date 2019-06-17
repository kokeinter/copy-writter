class RecruitsController < ApplicationController

  before_action :recruit_params,only:[:create]

  def index
    @recruits = Recruit.all
  end

  def new
    @recruit = Recruit.new
  end

  def create
    Recruit.create(job: recruit_params[:job],address: recruit_params[:address],salary: recruit_params[:salary],image: recruit_params[:image],company_id: current_company.id)
    redirect_to recruits_path, method: :get
  end

  def edit
    @recruit = Recruit.find(params[:id])
  end

  def update
    recruit = Recruit.find(params[:id])
    if recruit.company_id == current_company.id
      recruit.update(recruit_params)
    end
    redirect_to recruits_path, method: :get
  end

  def destroy
    recruit = Recruit.find(params[:id])
    if recruit.company_id == current_company.id
      recruit.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def recruit_params
    params.require(:recruit).permit(:job,:address,:salary,:image)
  end

end
