class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :recipes
  has_many :comments
  has_many :likes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true

  # テーブルとのやりとりに関するメソッドはモデルに置く
  def liked_by?(recipe_id)
    likes.where(recipe_id: recipe_id).exists?
  end
end
