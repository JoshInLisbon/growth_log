Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#homepage'

  # projects
  get '/project/:id', to: 'projects#show', as: 'project'
  resources :projects, only: [:create, :index, :destroy]

  # users
  get '/user/:id', to: 'users#show', as: 'user'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
