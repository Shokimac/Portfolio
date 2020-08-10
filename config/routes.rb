Rails.application.routes.draw do
  root 'homes#top'
  get '/about' => 'homes#about'
  get '/dropped_letter' => 'homes#letter'
  get '/contact' => 'contacts#contact'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  namespace :admins do
    resources :users, only: [:show, :edit, :update] do
    get '/withdrawal' => 'users#withdrawal'
    patch '/withdrawal' => 'users#withdrawal_update'
    put '/withdrawal' => 'users#withdrawal_update'
    end
    resources :dropped_letters, only: [:index, :create, :edit, :update, :destroy]
    resources :episodes, only: [:show]
    resources :proverbs, only: [:show]
    get '/search' => 'searches#search'
  end

  resources :users, only: [:show, :edit, :update] do
  get '/withdrawal' => 'users#withdrawal'
  patch '/withdrawal' => 'users#withdrawal_update'
  put '/withdrawal' => 'users#withdrawal_update'
  end
  resources :episodes
  resources :episodes_favorites, only: [:create, :destroy]
  resources :proverbs
  resources :proverb_favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
  resources :bookmarks, only: [:index]
  get '/search' => 'searches#search'
  post '/episode_bookmarks' => 'bookmarks#episode_create'
  delete '/episode_bookmarks' => 'bookmarks#episode_destroy'
  post '/proverb_bookmarks' => 'bookmarks#proverb_create'
  delete '/proverb_bookmarks' => 'bookmarks#proverb_destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
