TopTen::Application.routes.draw do

  get "vote/index"

 	resources :surveys
 	match 'vote/:id', to: 'vote#index'

	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	match 'signout', to: 'sessions#destroy', as: 'signout'
	root :to => 'home#index'

end
