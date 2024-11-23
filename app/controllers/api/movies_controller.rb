module Api
  class MoviesController < ApplicationController
    def index
      genre = params[:genre]
      search = params[:search]
      page = params[:page].to_i > 0 ? params[:page].to_i : 1
      per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 10
    
      movies = Movie.all
      movies = movies.where(genre: genre) if genre.present?
      movies = movies.where("LOWER(title) LIKE ?", "%#{search.downcase}%") if search.present?
    
      total_movies = movies.count
      movies = movies.offset((page - 1) * per_page).limit(per_page)
    
      render json: {
        movies: movies,
        pagination: {
          current_page: page,
          per_page: per_page,
          total_pages: (total_movies / per_page.to_f).ceil,
          total_movies: total_movies
        }
      }
    end

    def recommendations
      user = User.find_by(id: params[:user_id])
      return render json: { error: "User not found" }, status: :not_found unless user

      favorite_movies = user.favorites
      @recommendations = RecommendationEngine.new(favorite_movies).recommendations
      render json: @recommendations
    end

    def user_rented_movies
      user = User.find_by(id: params[:user_id])
      return render json: { error: "User not found" }, status: :not_found unless user

      @rented = user.rented
      render json: @rented
    end

    def rent
      request_body = request.body.read.presence
      return render json: { error: "Missing request body" }, status: :bad_request unless request_body
    
      data = JSON.parse(request_body) rescue {}
      user_id = data["user_id"]
    
      return render json: { error: "Missing user_id" }, status: :bad_request unless user_id
    
      user = User.find_by(id: user_id)
      movie = Movie.find_by(id: params[:id])
    
      return render json: { error: "User not found" }, status: :not_found unless user
      return render json: { error: "Movie not found" }, status: :not_found unless movie
    
      if user.rented.exists?(id: movie.id)
        return render json: { error: "User has already rented this movie" }, status: :unprocessable_entity
      end
    
      if user.rented.count >= 3
        return render json: { error: "User has reached the rental limit of 3 movies" }, status: :unprocessable_entity
      end
    
      if movie.available_copies > 0
        movie.available_copies -= 1
        movie.save
        user.rented << movie
        render json: movie
      else
        render json: { error: "No copies available" }, status: :unprocessable_entity
      end
    end

    def return_movie
      request_body = request.body.read.presence
      return render json: { error: "Missing request body" }, status: :bad_request unless request_body
    
      data = JSON.parse(request_body) rescue {}
      user_id = data["user_id"]
    
      return render json: { error: "Missing user_id" }, status: :bad_request unless user_id
      return render json: { error: "Missing movie_id" }, status: :bad_request unless params[:movie_id]
    
      user = User.find_by(id: user_id)
      movie = Movie.find_by(id: params[:movie_id])
    
      return render json: { error: "User not found" }, status: :not_found unless user
      return render json: { error: "Movie not found" }, status: :not_found unless movie
    
      unless user.rented.exists?(id: movie.id)
        return render json: { error: "Movie not rented by the user" }, status: :unprocessable_entity
      end
    
      user.rented.delete(movie)
      movie.available_copies += 1
      movie.save
    
      render json: { message: "Movie successfully returned", movie: movie }, status: :ok
    end
  end
end