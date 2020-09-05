Rails.application.routes.draw do
#rootパス
root 'homes#top'

#userのdevise
devise_for :users, controllers: {
  registrations: 'users/registrations',
  passwords: 'users/passwords',
  sessions: 'users/sessions',
  omniauth_callbacks: 'users/omniauth_callbacks'}

get 'homes/top' => 'homes#top', as: 'user_top'
get 'homes/about' => 'homes#about', as: 'user_about'
resources :users, only: [:show, :edit, :update]
  get 'users/:id/unsubscribe' => 'users#unsubscribe', as: 'user_unsubscribe'
  patch 'users/:id/unsubscribe' => 'users#unsubscribe_done', as: 'user_unsubscribe_done'
  put '/users/:id/unsubscribe' => 'users#unsubscribe_done', as: 'users_unsubscribe_done'

resources :items do
  get 'search' => 'searches#search', as: 'search'
    member do
      get :download
    end
    resource :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
end

get  'contacts/index' =>'contacts#index'
post 'contacts/confirm' => 'contacts#confirm'
post 'contacts/done' => 'contacts#done'


# 管理者用サイトのrouting
devise_scope :admins do
	devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    passwords: 'admins/passwords',
    sessions: 'admins/sessions'}
end

namespace :admins do
	get 'homes/top' => 'homes#top', as:'top'
	resources :users, only: [:index, :edit, :show, :update]

    get 'search' => 'searches#search', as: 'search'
end

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

