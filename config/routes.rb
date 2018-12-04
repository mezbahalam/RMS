Rails.application.routes.draw do
  get '/sign_up' => 'users#new', :as => 'register'

  get '/confirm_email/:token', to: 'email_confirmations#confirm', as: 'confirm_email'

  root 'pages#index'

  resources :users
  resources :pages
  resources :candidates
  resources :jobs
  resources :admins
end
