TopTen::Application.routes.draw do

 	resources :questions

	resources :surveys
	resources :questions

	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	match 'signout', to: 'sessions#destroy', as: 'signout'
	root :to => 'home#index'

end
