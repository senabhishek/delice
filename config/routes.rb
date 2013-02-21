Delice::Application.routes.draw do
resources :users
resources :sessions, only: [:new, :create, :destroy, :failure]

root to: 'static_pages#home'
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match '/auth/destroy', :to => 'sessions#destroy'
  match '/home', to: 'static_pages#home'
  match '/faq', to: 'static_pages#faq'
  match '/about', to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
end
