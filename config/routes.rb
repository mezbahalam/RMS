Rails.application.routes.draw do
  get '/sign_up' => 'users#new', :as => 'register'

  get '/confirm_email/:token', to: 'email_confirmations#confirm', as: 'confirm_email'

  root 'pages#index'

  resources :users
  resources :pages
  resources :candidates
  resources :jobs do
    resources :candidate_jobs, except: [:index, :show] do
    end
  end
  resources :admins

  get '/candidate_jobs', controller: :candidate_jobs, action: :index
  get '/candidate_jobs/show/:job_id' => 'candidate_jobs#show', :as => :show_requests
end
