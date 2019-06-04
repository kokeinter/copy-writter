class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @odais = user.odais.order("created_at DESC")
    @copies = user.copies.order("created_at DESC")
  end

end
