ActionController::Routing::Routes.draw do |map|
  map.devise_for :users, :admin

  map.resources :home, :only => :index
  map.resources :admins, :only => [:index]

  map.root :controller => :home
  
  map.token '/token', :controller => 'home', :action => 'token'
end
