class RecipeTagRelation < ApplicationRecord

  belongs_to :recipe,  optional: :true
  belongs_to :tag

end
