ActionController::Routing::Routes.draw do |map|

  map.resources :home, :only => :index
  map.resource :user, :only => [:edit, :update]

  map.root :controller => :home
end
