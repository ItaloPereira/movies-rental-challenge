class ApplicationController < ActionController::API
  def home
    render json: {
      "message": "Welcome to the Movie Rental API!",
      "api_base_url": "/api",
      "endpoints": {
        "movies": "GET /api/movies",
        "recommendations": "GET /api/movies/recommendations?user_id=<user_id>",
        "rented_movies": "GET /api/users/:user_id/rented_movies",
        "rent_movie": "POST /api/movies/:movie_id/rent",
        "return_movie": "DELETE /api/movies/return?movie_id=<movie_id>"
      }
    }, status: :ok
  end

  def route_not_found
    render json: { error: "Route not found" }, status: :not_found
  end
end