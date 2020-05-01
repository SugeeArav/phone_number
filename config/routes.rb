Rails.application.routes.draw do
  get '/phones', to: 'phones#index'
  post '/phones', to: 'phones#create'
  post '/phones/:number', to: 'phones#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
