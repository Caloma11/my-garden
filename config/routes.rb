Rails.application.routes.draw do
  get 'plants/create'
  get 'plants/destroy'
  get 'plants/show'
  root "gardens#index"
  resources :gardens, only:[:show, :new, :create] do
    resources :plants, only: :create
  end
  resources :plants, only: [:destroy, :show]
end
