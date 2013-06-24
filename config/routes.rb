Demoable::Engine.routes.draw do
  match '/access_codes/login' => 'access_codes#login', :as => :access_codes_login
  match '/signin' => 'access_codes#signin', :as => :signin
  match '/access_codes/:id/approve' => 'access_codes#approve', :as => :access_codes_approve
  resources :access_codes

  root :to => 'access_codes#index'
end
