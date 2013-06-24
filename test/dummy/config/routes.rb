Rails.application.routes.draw do
  mount Demoable::Engine => "/demoable"
  resources :home

  root :to => 'home#index'
end
