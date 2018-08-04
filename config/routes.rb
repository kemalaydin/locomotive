Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
        sessions: 'users/sessions'
  }

  root "home#index"

  namespace :admin do
    resources :partners
    resources :activities, only: [:index]
    resources :people, except: [:new, :create]  
    get '/people/:id/confirm', to: 'people#confirm', as: 'person_confirm'
    get '/people/:id/reject', to: 'people#reject', as: 'person_reject'
    get '/', to: 'admins#index'
  end

  namespace :partner do
    get '/', to: 'partners#index'
    get '/people/:id', to: 'partners#show', as: 'person'
    get '/people/:id/confirm', to: 'partners#confirm', as: 'person_confirm'
    get '/people/:id/reject', to: 'partners#reject', as: 'person_reject'
  end

  resources :people
  get '/open/:qr', to: 'people#card_login'
  get '/redirect', to: 'home#redirect', as: 'redirect_type'
end
