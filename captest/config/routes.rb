Rails.application.routes.draw do
  resources :timers

  resources :accesses

 # resources :events

 # resources :meets

  resources :seasons do
	resources :meets, shallow: true do
		resources :events, shallow: true
	end
  end

  devise_for :users
  
  root 'seasons#index'
  #get '/meets/, to: 'meets#index', as: 'track_meet'

end
