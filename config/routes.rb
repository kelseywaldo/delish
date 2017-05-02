Rails.application.routes.draw do
  root 'homepages#index'

  resources :recipes, only: [:index, :show]
end
