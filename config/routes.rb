Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/search', to: 'search_patients#search'
  get '/payment', to: 'get_payment#index'
  
  resources :get_doctor_patients, only: [:index]
  resources :in_patients, param: :novem_digit, only: [:create]
  resources :out_patients, param: :novem_digit, only: [:create]
  root to: "static_pages#index"
end
