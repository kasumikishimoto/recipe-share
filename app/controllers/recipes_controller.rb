class RecipesController < ApplicationController
  before_action :move_to_index, expect:[:index, :show]

  def index
    @recipes = Recipe.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
    redirect_to root_path unless current_user.id == @recipe.user_id
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    if @recipe.save
      redirect_to recipe_path
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    if recipe.destroy
      redirect_to root_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :material, :text, :category_id, :time_require_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
