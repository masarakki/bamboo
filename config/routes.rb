Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:update]
  root to: 'top#index'
end
