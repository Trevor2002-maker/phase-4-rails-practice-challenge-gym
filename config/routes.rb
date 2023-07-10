Rails.application.routes.draw do
  resources :gyms, except: [:index]
  resources :clients, except: [:index]
  resources :memberships, only: [:create]
end