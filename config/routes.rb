Rails.application.routes.draw do
  devise_for :users
  get '/mypage' => 'users#mypage'
  resources :users, only: [:show, :edit, :update, :destroy]
end
