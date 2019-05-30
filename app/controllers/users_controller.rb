class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @odais = user.odais
    @copies = user.copies
  end

end
