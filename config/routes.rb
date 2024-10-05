Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  
  get "home/index"
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  namespace :admin do
    get "dashboard", to: "dashboard#index", as: :dashboard
  end

  root "home#index"
  resources :users do
    resources :tasks
  end
end