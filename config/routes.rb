Rails.application.routes.draw do
  resources :categories
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  
  get 'about', to: 'pages#about'
  get 'managers', to: 'pages#managers'
  get 'advertise', to: 'pages#advertise'
  get 'event', to: 'pages#event'
  get 'library', to: 'pages#library'
  get 'contact', to: 'pages#contact'
    
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
