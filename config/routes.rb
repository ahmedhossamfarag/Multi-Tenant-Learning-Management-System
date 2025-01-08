Rails.application.routes.draw do
  get "student_payments/stripe"
  post "/webhooks/stripe", to: "student_payments#webhooks"
  get "student_payments/success"
  get "student_payments/cancel"
  get "student_payments/", to: "student_payments#index"
  get "student_payments/:id", to: "student_payments#show"
  resources :payments
  resources :chat_rooms
  resources :activities
  devise_for :users, sign_out_via: [ :get ], controllers: {
    registrations: "users/registrations"
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "" => "application#index", as: :app_root

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
