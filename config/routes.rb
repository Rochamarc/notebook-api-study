Rails.application.routes.draw do
  # get 'addresses/show'

  resources :kinds
  
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'
    
    resource :address, only: [:show]
    resource :address, only: [:show], path: 'relationships/address' 
    
    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
