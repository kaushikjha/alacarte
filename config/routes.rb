ActionController::Routing::Routes.draw do |map|
  map.with_options(:controller => 'pages', :action => 'show') do |pages|
    pages.connect '/', :id => 'home'
    pages.connect '/pages/:id'
  end
end
