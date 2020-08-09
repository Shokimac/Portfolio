Rails.application.routes.draw do
  namespace :admins do
    get 'searches/search'
  end
  namespace :admins do
    get 'users/index'
    get 'users/show'
  end
  namespace :admins do
    get 'proverbs/show'
  end
  namespace :admins do
    get 'episodes/show'
  end
  namespace :admins do
    get 'dropped_letters/index'
    get 'dropped_letters/edit'
  end
  get 'contact/contact'
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
  
  
  get 'bookmarks/index'
  get 'proverbs/new'
  get 'proverbs/show'
  get 'proverbs/edit'
  get 'proverbs/index'
  get 'episodes/new'
  get 'episodes/show'
  get 'episodes/edit'
  get 'episodes/index'
  get 'users/show'
  get 'users/edit'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
