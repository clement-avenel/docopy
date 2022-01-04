require 'sidekiq/web'

Rails.application.routes.draw do
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end

  devise_for :users

  root to: 'home#index'

  get 'documentation', to:'documentation#index'
  get 'templates', to:'templates#index'


end
