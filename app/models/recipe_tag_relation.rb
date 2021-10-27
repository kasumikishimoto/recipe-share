class RecipeTagRelation < ApplicationRecord

  belongs_to :recipe,  optional: :true
  belongs_to :tag

with_options presence: true do
  validates :user_id
  validates :title
  validates :material
  validates :text
  validates :category_id
  validates :time_require_id
  validates :name
  validates :images
 end


end
