Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :partners
    resources :activities, only: [:index]
    get '/', to: 'admins#index'
  end
  resources :people
end
