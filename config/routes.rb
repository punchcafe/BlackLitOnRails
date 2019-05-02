Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'public#home'

  get '/adminportal' => 'admins#portal'
  get '/admindashboard' => 'admins#index'

  resources :admins

  resource :admin do
    resources :public_text, only: [:edit, :update, :index]
    resources :episodes do
      resource :episodeimage, only: [:destroy]
    end
  end




  # DELETE '/admin/episodes/:id/episode_image'

  post '/session' => 'sessions#create'
  delete '/session' => 'sessions#delete'
end
