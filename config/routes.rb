Rails.application.routes.draw do
  root "home#index"

  # NEW
  resources :save_files, only: :show do
    resources :player_characters, only: :index
  end
  
  resources :player_characters, only: :show do
    resources :items, only: %i[index toggle] # might move this
  end


  # LEGACY
  resources :characters, only: %i[index show] do
    resources :inventory_items, only: :index

    scope :attack, as: :attack do
      resources :monsters, only: :show
    end
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

    resources :inventory_items, only: [] do
      member do
        post :loot
      end
    end
  end

  resources :inventory_items, only: [] do
    member do
      post :toggle
    end
  end
end
