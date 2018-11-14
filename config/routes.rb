Rails.application.routes.draw do
  resources :jobs
  get '/sign_up' => 'users#new', :as => 'register'

  get '/confirm_email/:token', to: 'email_confirmations#confirm', as: 'confirm_email'
  post '/resend_confirmation', to: 'email_confirmations#resend_confirmation', as: 'resend_confirmation'

  root 'candidates#index'

  resources :users
  resources :candidates do
    member do
      get :delete
    end
  end
end
