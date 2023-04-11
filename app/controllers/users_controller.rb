class UsersController < ApplicationController
  def show
    @name = current_user.name
    @items = current_user.items
  end
end
