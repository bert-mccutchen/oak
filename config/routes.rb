Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  mount MissionControl::Jobs::Engine, at: "/jobs"

  resources :applications, param: :token
  resources :bookmarks, param: :token
  resources :categories, param: :token
  resources :icons, param: :slug, only: %i[index show]
  resources :imports, only: %i[new create]
  resources :quotes, param: :token do
    collection do
      patch :reroll_daily
    end
  end
  resources :settings, param: :slug, only: %i[index update]
  resources :themes, param: :token
  resource :search, only: %i[show]

  get "home/index", as: :home
  get "home/preview", as: :home_preview

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"

  get "/coffee", to: "errors#show", defaults: { code: 418 }
  match "/:code", to: "errors#show", via: :all, constraints: { code: /\d{3}/ }, as: :error
end
