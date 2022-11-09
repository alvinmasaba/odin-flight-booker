Rails.application.routes.draw do
  root "flights#index"

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :flights

  resources :bookings, only: [:new, :create, :show]

  resources :passengers, only: [:new, :create]

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :flights
    end
  end
end
