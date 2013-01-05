Wanacie::Application.routes.draw do
  resources :comments 
  resources :users, :except => ['show', 'edit']
  resources :events

  match 'events/:id/join' => 'events#join', :via => :post

  match 'signup' => 'users#new', :via => :get, :as => :signup
  match 'signin' => 'login#index', :via => :get, :as => :signin
  match 'signout' => 'login#logout', :via => :get, :as => :signout
  match 'settings/account' => 'users#edit', :via => :get, :as => :account
  match 'search' => 'search#index', :via => :get, :as => :search_index
  match 'search/result', :via => :put
  match ':name' => 'users#show', :via => :get, :as => :user_by_name

  match 'about/:page' => 'pages#show', :via => :get, :as => :about

  # Test
  match 'ajax/result', :via => :put
  match 'ajax/yahoo', :via => :put
  match 'ajax/time_update', :via => :put

  match ':controller(/:action(/:id(.:format)))'
  root :to => 'events#index'
end
