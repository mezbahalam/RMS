Rails.application.routes.draw do
  resources :candidates do
    member do
      get :delete
    end
  end
end
