Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/about'

  get 'pages/managers'

  get 'pages/advertise'

  get 'pages/event'

  get 'pages/library'

  get 'pages/contact'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
