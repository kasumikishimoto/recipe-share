class RecipesController < ApplicationController
  before_action :move_to_index, except:[:index, :show, :research]

  def index
    @recipes = Recipe.order('created_at DESC')
  end

  def new
    @recipe = RecipesTag.new
  end

  def create
    @recipe = RecipesTag.new(recipe_params)
    if @recipe.valid? 
       @recipe.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
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

  def research
    @recipes = Recipe.research(params[:keyword])
   end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"])
    render json:{ keyword: tag }
  end


  private

  def recipe_params
    params.require(:recipes_tag).permit(:title, :material, :text, :category_id, :time_require_id, :image, :name, :recipe_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
