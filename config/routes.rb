Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :categories
  resources :portfolios, except: [:show]
  get 'facilitators-items', to: 'portfolios#facilitators'
  get 'training_managers-items', to: 'portfolios#training_managers'
  get 'equipment_managers-items', to: 'portfolios#equipment_managers'
  get 'event_manager-items', to: 'portfolios#event_manager'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

    
  
  get 'about', to: 'pages#about'
  get 'managers', to: 'pages#managers'
  get 'advertise', to: 'pages#advertise'
  get 'event', to: 'pages#event'
  get 'library', to: 'pages#library'
  get 'contact', to: 'pages#contact'
  
  get "concerns/new_contact" => 'concerns#new_contact', :as => :new_contact
    
   #get 'pages/trainers'
   #get 'pages/equipmentproviders'
   #get 'pages/eventmanagers'
   #get 'pages/facilitators'
  
  resources :posts do
    member do 
	    get :toggle_status
	  end
    end 	  

  root to: 'pages#home' 
end
