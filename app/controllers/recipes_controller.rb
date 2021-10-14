class RecipesController < ApplicationController

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :material, :text, :image).merge(user_id: current_user.id)
  end
end
