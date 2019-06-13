Rails.application.routes.draw do
  root "clinics#index"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, only: [:destroy, :show]
  resources :clinics, only: [:index, :new, :create, :show, :edit, :update]
  resources :patients, only: [:new, :create, :show, :edit, :update]
  resources :physicians, only: [:new, :create, :edit, :update]
  resources :reviews, only: [:create, :destroy]
  resources :calendars, only: [:show, :create, :destroy] do
    member do
      post :finish
    end
  end

  namespace :admin do
    root "majors#index"
    resources :majors, except: :show
  end
end
