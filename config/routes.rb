Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'current', to: 'integers#current'
      put 'current', to: 'integers#reset'
      get 'next', to: 'integers#next'
    end
  end
end
