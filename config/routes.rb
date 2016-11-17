Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get "/oauth/connect",      to: 'home#connect'
  get "/oauth/callback",     to: 'home#callback'
end
