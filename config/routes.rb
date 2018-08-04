Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :partners
    resources :activities, only: [:index]
    resources :people, except: [:new, :create]  
    get '/people/:id/confirm', to: 'people#confirm', as: 'person_confirm'
    get '/people/:id/reject', to: 'people#reject', as: 'person_reject'
    get '/', to: 'admins#index'
  end
  resources :people
  get "/card" => "cards#card"
  resources :reference_codes, only: [:new, :create, :destroy]
end
