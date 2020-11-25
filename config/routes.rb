Rails.application.routes.draw do
  devise_for :users
  root to:"ideas#index"
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show, :edit, :update, :destroy]

  resources :ideas do
    collection do
      get 'list'
    end
    collection do
      get 'search'
    end
  end
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
