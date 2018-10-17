Rails.application.routes.draw do
  # get '/sign_up' => 'clearance/users#new'
  # get '/sign_in' => 'clearance/sessions#new'
  root 'home#index'
  resources :candidates do
    member do
      get :delete
    end
  end
end
