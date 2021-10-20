class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :time_require
  has_one_attached :image
  has_many :comments
  has_many :recipe_tag_relations
  has_many :tags, through: :recipe_tag_relations

  with_options presence: true do
    validates :title
    validates :material
    validates :text
    validates :category_id, numericality: { other_than: 0 } 
    validates :time_require_id, numericality: { other_than: 0, message: "can't be blank" } 
  end
end