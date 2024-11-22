class User < ApplicationRecord
  has_many :favorite_movies
  has_many :rentals
  has_many :favorites, through: :favorite_movies, source: :movie
  has_many :rented, through: :rentals, source: :movie
end