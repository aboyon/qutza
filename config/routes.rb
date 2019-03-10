Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}, :skip => [:registrations]

  as :user do
    get 'users/edit' => 'users/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'users/registrations#update', :as => 'user_registration'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :customers, :except => [:destroy] do
      member do
        get 'activities'
        patch 'activities', :to => "customers#update_activities"
      end
    end
    resources :activities, :except => [:destroy]
    resources :invoices, :except => [:new, :create, :destroy], :controller => 'invoices'
    resources :customer_accesses, :only => [:index]
    get '/', :to => "customers#index"
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root :to => "home#index"
end
