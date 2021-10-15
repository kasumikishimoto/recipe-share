class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :time_require
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :material
    validates :text
    validates :category_id, numericality: { other_than: 1 } 
    validates :time_require_id, numericality: { other_than: 1, message: "can't be blank" } 
  end
end