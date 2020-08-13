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
               registrations: 'users/registrations',
               omniauth_callbacks: 'users/omniauth_callbacks'
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
    resources :bookmarks, only: %i[index]
  end
  resources :episodes do
    resource :favorites, only: %i[create destroy]
    resource :bookmarks, only: %i[create destroy]
  end
  resources :proverbs do
    resource :favorites, only: %i[create destroy]
    resource :bookmarks, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
  end
  get '/search' => 'searches#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
