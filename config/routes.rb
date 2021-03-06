Patrickholloway::Application.routes.draw do
  
  devise_for :users
  
  resources :styles
  resources :users
  resources :fonts
  
  get '/user/current_user' => 'backbone_queries#crrnt_user'
  get '/user/current_user_fonts' => 'backbone_queries#crrnt_user_fonts'
  
  get '/welcome' => 'pages#welcome', as: 'welcome'
  get '/about' => 'pages#about', as: 'about'
  get 'talks' => 'pages#talks', as: 'talks'
  get '/home' => 'pages#home', as: 'home'
  get '/resume' => 'pages#resume', as: 'resume'
  
  root :to => 'pages#home'
end
