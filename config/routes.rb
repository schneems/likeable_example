ActionController::Routing::Routes.draw do |map|
  map.devise_for :user, :admin

  map.resources :home, :only => :index
  map.resource :user, :only => [:edit, :update]
  map.resources :admins, :only => [:index]

  map.root :controller => :home
end
