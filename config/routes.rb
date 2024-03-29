Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:destroy]

  get '/my_dashboard', to: 'dashboard#profile'
end
