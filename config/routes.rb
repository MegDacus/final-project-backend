Rails.application.routes.draw do
  
  resources :books, only: [:index, :show, :destroy, :create]
  resources :users, only: [:index]

  resources :bookclubs, only: [:index, :show, :destroy, :create] do
    resources :memberships, only: [:index, :create, :destroy]
    resources :bookclub_books, only: [:index, :create]
    resources :discussion_questions, only: [:index, :show, :create, :destroy] do 
      resources :comments, only: [:index, :create, :destroy]
    end
  end
  
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/save_image', to: 'users#save_image'
  get '/get_image/:id', to: 'users#get_image';
  post '/admin_signup', to: 'users#admin_create'

end
