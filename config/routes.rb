Delice::Application.routes.draw do
get '/login', :to => 'sessions#new', :as => :login
root to: 'static_pages#home'
  #match '/signup',  to: 'users#new'
  #match '/signin',  to: 'sessions#new'
  #match '/signout', to: 'sessions#destroy', via: :delete
  match '/home', to: 'static_pages#home'
  match '/faq', to: 'static_pages#faq'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match '/auth/destroy', :to => 'sessions#destroy'
end
