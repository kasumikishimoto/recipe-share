class Comment < ApplicationRecord
  t.integer :user_id
  t.integer :recipe_id
  t.text :comment
end
