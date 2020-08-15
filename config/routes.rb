Rails.application.routes.draw do
  # get 'addresses/show'

  resources :kinds
  
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'
    
    resource :address, only: [:show, :update, :create, :destroy]
    resource :address, only: [:show, :update, :create, :destroy], path: 'relationships/address' 
    
    resource :phones, only: [:show]
    resource :phone, only: [:create, :update, :destroy]
    resource :phones, only: [:show], path: 'relationships/phones'
    resource :phone, only: [:create, :update, :destroy], path: 'relationships/phone' 
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
