class RecipesController < ApplicationController

  def index
    @recipes = Recipe.order("created_at DESC")
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      reirect_to root_path
    else
      render :new
    end
  end

  private
  
  def recipe_params
    params.require(:recipe).permit(:title, :material, :text, :image, :category_id, :time_require_id).merge(user_id: current_user.id)
  end
end
