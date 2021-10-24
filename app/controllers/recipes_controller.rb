class RecipesController < ApplicationController
  before_action :move_to_index, except:[:index, :show, :research]

  def index
    @recipes = Recipe.order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # params[:recipe][:name] # => "#test #coffee"
    # tags = params[:recipe][:name].split(" ") # => ["#test", "#coffee"]
    # tags = tags.map do |tag|
    #   tag.where(name: tag).first_or_initialize
    # end
    # 
    # if @recipe.valid? & params[:recipe][:name].presence
    
    tag = Tag.where(name: params[:recipe][:name]).first_or_initialize

    if @recipe.valid? & tag.valid?
      @recipe.save
      tag.save

      RecipeTagRelation.create(recipe_id: @recipe.id, tag_id: tag.id)
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
    params.require(:recipe).permit(:title, :material, :text, :category_id, :time_require_id, :recipe_id, images: []).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
