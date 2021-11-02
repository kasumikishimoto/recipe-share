class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :time_require
  has_many_attached :images
  has_many :comments
  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tags, through: :recipe_tag_relations
  has_many :likes


  with_options presence: true do
    validates :category_id, numericality: { other_than: 0 } 
    validates :time_require_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :title
    validates :material
    validates :text
    validates :images
  end

  def self.research(research)
    if research != ""
      Recipe.joins(:tags).where('tags.name LIKE ?',  "%#{research}%")
    else
      Recipe.all
    end
  end

end