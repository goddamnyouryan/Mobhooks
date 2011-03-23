ActionController::Routing::Routes.draw do |map|

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  map.terms 'terms', :controller => 'users', :action => 'terms'
  map.thefamily 'thefamily', :controller => 'users', :action => 'index'
  map.about 'about', :controller => "achievements", :action => 'index'
  map.faq 'faq', :controller => "home", :action => 'show'
  map.business_owners 'business_owners', :controller => 'affiliates', :action => 'new'
  map.reset_password 'reset_password', :controller => 'password_resets', :action => 'new'
  map.leave_suggestions 'leave_suggestions', :controller => 'suggestions', :action => 'new'
  map.skip_business 'skip_business', :controller => 'businesses', :action => 'skip_business'
  map.confirm 'businesses/confirm', :controller => 'businesses', :action => 'confirm'
  map.disconfirm 'businesses/disconfirm', :controller => 'businesses', :action => 'disconfirm'
  map.printable_coupons 'printable_coupons', :controller => 'campaigns', :action => 'printable_coupons'
  map.contest 'contest', :controller => "home", :action => "contest"
  
  # admin routes
  map.connect '/campaigns/admin', :controller => 'campaigns', :action => 'admin'
  map.connect '/businesses/admin', :controller => 'businesses', :action => 'admin'
  map.connect '/users/admin', :controller => 'users', :action => 'admin'
  
  map.resources :user_sessions
  map.resources :campaigns, :has_many => :reviews
  map.resources :businesses, :has_many => :locations
  map.resources :users, :has_many => :comments
  map.resources :profiles
  map.resources :comments
  map.resources :reviews
  map.resources :achievements
  map.resources :affiliates
  map.resources :password_resets
  map.resources :locations
  map.resources :suggestions
  
  map.root :controller => 'home', :action => 'index'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
