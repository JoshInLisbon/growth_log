Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#homepage'

  # projects
  resources :projects, only: [:create, :index, :destroy, :show]
  # users
  get '/u/:id', to: 'users#show', as: 'user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
