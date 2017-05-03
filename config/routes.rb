Rails.application.routes.draw do
  root 'homepages#index'
  resources :recipes, only: [:index]
  get 'recipes/:name', to: 'recipes#show', as: "recipe"
end
