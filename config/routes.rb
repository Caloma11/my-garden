Rails.application.routes.draw do
  root "gardens#index"
  resources :gardens, only:[:show, :new, :create] do
    resources :plants, only: :create
  end


  resources :plants, only: [:destroy, :show] do
    resources :plant_tags, only: [:new, :create]
  end

# localhost:3000/plants/5/plant_tags/new



end
