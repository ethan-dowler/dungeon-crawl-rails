Rails.application.routes.draw do
  root 'home#index'

  resources :characters, only: %i[index show] do
    resources :inventory, only: :index

    scope :attack, as: :attack do
      resources :monsters, only: :show
    end
  end

  resources :dungeon_runs, only: %i[create show] do
    member do
      get :go
      post :end
      get :ended
    end

    resources :monsters, only: [] do
      member do
        post :attack
      end
    end

    resources :inventory_items, only: [] do
      member do
        post :loot
      end
    end
  end
end
