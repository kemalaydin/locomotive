Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :partners
  end
  resources :people
end
