Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :users, except: [:new, :destroy, :create]
  resources :stayhotels do
    member do
      resources :reservations
    end
  end
  get '/reservations',to: 'reservations#index', as: 'reservations_index'
  get '/stayhotels/:id/reservations/new',to: 'reservations#new', as: 'reservations_new'
  post '/stayhotels/:id/reservations/confirm',to: 'reservations#confirm', as: 'reservations_confirm'
  post '/stayhotels/:id/reservations/back',to: 'reservations#back', as: 'reservations_back'
  post '/stayhotels/:id/reservations/complete',to: 'reservations#complete', as: 'reservations_complete'
end