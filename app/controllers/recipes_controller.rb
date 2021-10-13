class RecipesController < ApplicationController

  def index
    
  end

  def new
    
  end

  def create
    
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :material, :text, :image).merge(user_id: current_user.id)
  end
end
