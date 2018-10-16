Rails.application.routes.draw do
  root 'home#index'
  resources :candidates do
    member do
      get :delete
    end
  end
end
