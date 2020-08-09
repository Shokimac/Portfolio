Rails.application.routes.draw do
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
