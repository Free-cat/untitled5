Rails.application.routes.draw do
  post '/api/v1/user/token', to: 'user#token'
  post '/api/v1/user/verify', to: 'user#verify'
  post '/api/v1/user/create', to: 'user#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
