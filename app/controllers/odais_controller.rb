class OdaisController < ApplicationController

  def index
    @odais = Odai.order("created_at DESC")
  end

  def new
    @odai = Odai.new
  end


end
