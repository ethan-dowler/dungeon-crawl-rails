Rails.application.routes.draw do
  root "home#index"

  resources :characters, only: %i[index show]

  resources :dungeon_runs, only: %i[create show] do
    member do
      get :go
    end
  end
end
