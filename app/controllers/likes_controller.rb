class LikesController < ApplicationController

  def create
    Like.create(user_id: current_user.id, recipe_id: params[:id])
    redirect_to recipes_path
  end
end
