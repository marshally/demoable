Demoable::Engine.routes.draw do
  match '/access_codes/login' => 'access_codes#login', :as => :access_codes_login

  resources :access_codes

  root :to => 'access_codes#index'
end
