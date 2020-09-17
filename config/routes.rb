Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # get 'addresses/show'
  
  # resources :auths, only: [:create]
  resources :kinds
  
  # Pega a versao da mesma maneira que query parameter, porem atraves da lib versionist
  constraints subdomain: 'v1' do  
    scope module: 'v1' do  
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
    end
  end

  constraints subdomain: 'v2' do
    scope module: 'v2' do
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
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
