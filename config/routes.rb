Rails.application.routes.draw do
  devise_for :users
  root to:"ideas#index"
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show, :edit, :update, :destroy]

  resources :ideas
end
