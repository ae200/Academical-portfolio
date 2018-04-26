Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :categories
  resources :portfolios, except: [:show]
  resources :jobs
  get 'facilitators', to: 'portfolios#facilitators'
  get 'training_managers', to: 'portfolios#training_managers'
  get 'equipment_managers', to: 'portfolios#equipment_managers'
  get 'event_managers', to: 'portfolios#event_manager'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

    
  
  get 'about', to: 'pages#about'
  get 'managers', to: 'pages#managers'
  get 'advertise', to: 'pages#advertise'
  get 'events', to: 'pages#events'
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

  root to: 'home#index' 
end
