class Tag < ApplicationRecord

  has_many :recipe_tag_relations
  has_many :recipes, through: :recipe_tag_relations

  validates :name, uniqueness: true

end