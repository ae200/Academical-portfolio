Rails.application.routes.draw do
  resources :categories
  resources :portfolios
  get 'pages/home'

  get 'pages/about'

  get 'pages/managers'

  get 'pages/advertise'

  get 'pages/event'

  get 'pages/library'

  get 'pages/contact'
  
  get 'pages/trainers'
  
  get 'pages/equipmentproviders'
  
  get 'pages/eventmanagers'
  
  get 'pages/facilitators'
  
  

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
