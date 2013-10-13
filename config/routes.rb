TopTen::Application.routes.draw do

 	resources :surveys

	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	match 'signout', to: 'sessions#destroy', as: 'signout'
	root :to => 'home#index'

end
