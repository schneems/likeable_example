ActionController::Routing::Routes.draw do |map|

  map.resources :home, :only => :index

  map.resource :session, :only => [:new, :create, :destroy]
  map.root :controller => :home
end
