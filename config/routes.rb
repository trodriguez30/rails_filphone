Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'user/genders', to: 'users#genders'
      resources :users, :headquarters, :phones, :purchases
    end
  end
  get 'welcome/index'

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
