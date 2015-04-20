Rails.application.routes.draw do
  resources :converters

  resources :notes

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
 
  get 'history', to: 'seasons#history'
  get 'best', to: 'seasons#best' 
  get 'test', to: 'events#test'
  
  root 'seasons#index'
  #get '/meets/, to: 'meets#index', as: 'track_meet'

end


