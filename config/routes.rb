require 'sidekiq/web'

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users

  root to: 'home#index'

  get 'documentation', to:'documentation#index'

  get 'templates', to:'templates#index', as: 'templates'
  post 'templates', to: 'templates#create'
  get 'templates/new', to:'templates#new', as: 'new_template'
  get 'templates/:id/edit', to: 'templates#edit', as: 'edit_template'
  get 'templates/:id', to: 'templates#show', as: 'template'
  patch 'templates/:id', to: 'templates#update'
  delete 'templates/:id', to: 'templates#destroy'

end
