Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :partners
    get '/', to: 'admins#index'
  end
  resources :people
end
