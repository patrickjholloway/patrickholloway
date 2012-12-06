Patrickholloway::Application.routes.draw do
  
  resources :styles
  resources :users
  resources :fonts

  devise_for :users
  
  get '/user/currentuser' => 'users#currentuser'
  
  get '/about' => 'pages#about', as: 'about'
  get '/home' => 'pages#home', as: 'home'
  get '/resume' => 'pages#resume', as: 'resume'
  
  root :to => 'pages#home'
end
