Rails.application.routes.draw do
  resources :candidates, :jobs
  root 'jobs#index'
end
