Fomotest::Application.routes.draw do

  resources :users

  resources :events do
    resources :notes
  end

  match '/notes' => 'notes#all', :via => :get

  root :to => 'home#index'

	match '/home' => 'home#index', :via => :get
	match '/about' => 'home#about', :via => :get
	match '/faq' => 'home#faq', :via => :get
	match '/login' => 'session#new', :via => :get
	match '/login' => 'session#login', :via => :post
	match '/logout' => 'session#destroy', :via => 'get'
	match '/findbydate/:date' => 'events#findbydate', :via => 'get', :as => 'findbydate'

end
