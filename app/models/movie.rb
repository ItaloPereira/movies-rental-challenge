class Movie < ApplicationRecord
  has_many :favorite_movies
  has_many :users, through: :favorite_movies
end
  