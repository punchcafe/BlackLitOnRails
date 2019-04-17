Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/adminportal' => 'admins#portal'
  get '/admindashboard' => 'admins#dashboard'

  resources :admins

  resource :admin do
    resources :episodes
  end

  post '/session' => 'sessions#create'
  delete '/session' => 'sessions#delete'
end
