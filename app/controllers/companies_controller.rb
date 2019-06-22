class CompaniesController < ApplicationController
  def show
    @recruits = Recruit.where(company_id: current_company.id)
  end
end
