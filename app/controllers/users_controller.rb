class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end

end
