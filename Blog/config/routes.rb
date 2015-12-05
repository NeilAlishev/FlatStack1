Rails.application.routes.draw do
  devise_for :users
  resources :posts do
  resources :comments
end
  delete 'comment' => 'comments#destroy'
  root 'posts#index'
  end
