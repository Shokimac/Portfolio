Rails.application.routes.draw do
  namespace :admins do
    get 'tops/top'
  end
  root 'homes#top'
  get '/about' => 'homes#about'
  get '/dropped_letter' => 'homes#letter'
  get '/contact' => 'contacts#contact'

  devise_for :admins,
             controllers: {
               sessions: 'admins/sessions',
               passwords: 'admins/passwords',
               registrations: 'admins/registrations'
             }
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               passwords: 'users/passwords',
               registrations: 'users/registrations'
             }
  namespace :admins do
    resources :users, only: %i[show edit update] do
      get '/withdrawal' => 'users#withdrawal'
      patch '/withdrawal' => 'users#withdrawal_update'
      put '/withdrawal' => 'users#withdrawal_update'
    end
    resources :dropped_letters, only: %i[index create edit update destroy]
    resources :episodes, only: %i[show]
    resources :proverbs, only: %i[show]
    get '/top' => 'tops#top'
    get '/search' => 'searches#search'
  end

  resources :users, only: %i[show edit update] do
    get '/withdrawal' => 'users#withdrawal'
    patch '/withdrawal' => 'users#withdrawal_update'
    put '/withdrawal' => 'users#withdrawal_update'
  end
  resources :episodes
  resources :episodes_favorites, only: %i[create destroy]
  resources :proverbs
  resources :proverb_favorites, only: %i[create destroy]
  resources :post_comments, only: %i[create destroy]
  resources :bookmarks, only: %i[index]
  get '/search' => 'searches#search'
  post '/episode_bookmarks' => 'bookmarks#episode_create'
  delete '/episode_bookmarks' => 'bookmarks#episode_destroy'
  post '/proverb_bookmarks' => 'bookmarks#proverb_create'
  delete '/proverb_bookmarks' => 'bookmarks#proverb_destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
