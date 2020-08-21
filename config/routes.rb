Rails.application.routes.draw do
  namespace :admins do
    get 'searches/search'
  end
  namespace :admins do
    get 'homes/top'
  end
  namespace :admins do
    get 'members/edit'
    get 'members/index'
    get 'members/show'
  end
  get 'homes/about'
  get 'homes/top'
  get 'items/new'
  get 'items/index'
  get 'items/create'
  get 'items/show'
  get 'items/edit'
  get 'users/edit'
  get 'users/show'
  get 'users/unsubscribe'
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
