Rails.application.routes.draw do
  resources :players, only: [:index, :create, :destroy]
  resources :matches, only: [:new, :create]

  get "leaderboard", to: "players#leaderboard"
end
