Demoable::Engine.routes.draw do
  resources :access_codes
  root :to => 'access_codes#index'
end
