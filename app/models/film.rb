class Film < ApplicationRecord
  has_many :comments
  has_many :commentators, through: :comments, source: :user
end
