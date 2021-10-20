class RecipesTag
  include ActiveModel::Model
  attr_accessor :recipe_id, :user_id, :title, :material, :text, 
                :category_id, :time_require_id, :image, :name

  with_options presence: true do
    validates :user_id
    validates :title
    validates :material
    validates :text
    validates :category_id
    validates :time_require_id
    validates :name
    validates :image
  end


  def save
    recipe = Recipe.create(user_id: user_id, title: title, material: material, text: text, 
                           category_id: category_id, time_require_id: time_require_id, image: image)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    RecipeTagRelation.create(recipe_id: recipe.id, tag_id: tag.id)
  end
end