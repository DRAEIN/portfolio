Rails.application.routes.draw do
  resources :portfolio_pages
  get 'pages/home'

  get 'pages/about'

  get 'pages/contact'

  resources :blogs
  
  
end
