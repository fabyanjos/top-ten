TopTen::Application.routes.draw do

  get "vote/index"

 	resources :surveys
 	match 'vote/:survey_id', to: 'vote#index'
 	match 'vote/save/:survey_id', to: 'vote#save'

	match 'auth/:provider/callback', to: 'sessions#create'
	match 'auth/failure', to: redirect('/')
	match 'signout', to: 'sessions#destroy', as: 'signout'
	root :to => 'home#index'

end
