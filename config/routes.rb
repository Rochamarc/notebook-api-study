Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth' # Montagem da authenticaçao de usuario
  
  resources :kinds 
  
  # Pega a versao da mesma maneira que query parameter, porem atraves da lib versionist
  api_version(:module => "V1", :path => { :value => "v1" }) do
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
  
  api_version(:module => "V2", :path => { :value => "v2" }) do  
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
