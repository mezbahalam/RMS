Rails.application.routes.draw do
  resources :candidates, :jobs
  root 'jobs#new'
end
