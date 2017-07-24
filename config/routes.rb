Rails.application.routes.draw do
  resources :portfolio_pages, except: [:show, :index]
  get 'angular-items', to: 'portfolio_pages#angular'
  get 'portfolio_pages/:id', to: 'portfolio_pages#show', as: 'portfolio_show'
  get 'portfolios', to: 'portfolio_pages#index'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do 
  	member do
  		get :toggle_status
  	end
  end

  root to: 'pages#home'
  
  
end
