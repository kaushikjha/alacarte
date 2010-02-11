ActionController::Routing::Routes.draw do |map|
  map.resources :menus, :has_many => :categories

  map.with_options(:controller => 'pages', :action => 'show') do |pages|
    pages.connect '/', :id => 'home'
    pages.connect '/pages/:id'
  end

  map.resource :user_session
  map.resource :account, :controller => "users"
  map.resources :users, :has_many => "menus"

  map.login '/login', :controller => "user_sessions", :action => :new
  map.logout '/logout', :controller => "user_sessions", :action => :destroy
  map.register '/register', :controller => "users", :action => :new
end
