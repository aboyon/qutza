Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :customers, :except => [:destroy]
    resources :activities, :except => [:destroy]
    resources :invoices, :except => [:destroy], :controller => 'invoices'
    resources :customer_accesses, :only => [:index]
    get '/', :to => "customers#stats"
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
