Rails.application.routes.draw do
  get 'inquiries/new'
  get 'inquiry/inquiry'
  namespace :admins do
    get 'tops/top'
  end
  root 'homes#top'
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
    resources :users, only: %i[index show edit update] do
      patch '/withdrawal' => 'users#withdrawal'
      put '/withdrawal' => 'users#withdrawal'
    end
    resources :dropped_letters, only: %i[index create edit update destroy]
    resources :episodes, only: %i[show destroy]
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

  get '/episodes/search' => 'episodes#search'
  get '/episodes/result' => 'episodes#result', defaults: { format: :json }
  resources :episodes do
    resource :episode_favorites, only: %i[create destroy]
    resource :episode_bookmarks, only: %i[create destroy]
  end

  get '/proverbs/search' => 'proverbs#search'
  get '/proverbs/result' => 'proverbs#result', defaults: { format: :json }
  resources :proverbs do
    resource :proverb_favorites, only: %i[create destroy]
    resource :proverb_bookmarks, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
  end

  get '/search' => 'searches#search', defaults: { format: :json }

  resource :inquiries, only: %i[new create]

  get '/search' => 'searches#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
