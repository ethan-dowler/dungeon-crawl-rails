Rails.application.routes.draw do
  root 'home#index'

  resources :characters, only: %i[index show] do
    resources :inventory, only: :index
  end

  resources :dungeon_runs, only: %i[create show] do
    member do
      get :go
      post :end
    end

    resources :monsters, only: [] do
      member do
        post :attack
      end
    end
  end
end
