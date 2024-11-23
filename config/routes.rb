Rails.application.routes.draw do
  root "application#home"

  namespace :api do
    resources :movies, only: %i[index] do
      get :recommendations, on: :collection
      get :user_rented_movies, on: :collection
      post :rent, on: :collection
    end
  end

  match '*unmatched', to: 'application#route_not_found', via: :all
end