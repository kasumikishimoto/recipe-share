class UsersController < ApplicationController

  def index
    @user = User.find(params[:id])
    @recipe = @user.recipes
  end

  def show
    @user = User.find(params[:id])
  end

end
