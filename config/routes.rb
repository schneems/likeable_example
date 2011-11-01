DeviseExample::Application.routes.draw do
  resources :posts

  devise_for :users, :admin

  resources :home, :only => :index
  resources :admins, :only => :index

  root :to => 'home#index'

  match '/token' => 'home#token', :as => :token
  
  post 'likes/:resource_name/:resource_id' => 'likes#create', :as => 'like'
  delete 'likes/:resource_name/:resource_id' => 'likes#destroy', :as => 'like'

end

