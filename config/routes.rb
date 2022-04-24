Rails.application.routes.draw do
  resources :share_capital_withdrawals
  resources :share_capitals
  resources :problem_forms
  resources :membership_withdrawals
  get 'hotels' => 'home#hotels'
  get 'hotels/rooms/:id' => 'home#rooms', as: :home_rooms
  get 'about' => 'home#about'
  get 'contact_us' => 'home#contact_us'
  get 'hotels/:id' => 'home#hotel_information', as: :home_hotel_information
  post 'book_hotel/:id' => 'home#book_hotel', as: :home_book_hotel
  get 'orders' => 'home#orders', as: :home_orders
  get 'faq' => 'home#faq'
  get 'profile' => 'profile#index'
  get 'profile/change_password'
  post 'profile/update_password'
  get '/message' => 'message#index'
  post '/message/create' => 'message#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :mobile_releases
  resources :notifications
  resources :players
  resources :game_records
  mount ActionCable.server => '/cable'

  resources :messages
  resources :streaming_rooms do
    member do
      get :viewers
      get :chats
      get :gifts
    end
  end
  resources :playmates do
    member do
      get :conversations
      get :exclusive_contents
      get :streams
    end
  end
  resources :billing_addresses
  resources :buyers do
    end
  resources :option_items
  resources :option_groups do
    end
  resources :variations
  resources :products do
        member do
      post :upload_image
      post :add_tags
      delete :delete_tag
      delete :delete_image
    end
  end
  resources :categories
  resources :merchants do
      member do
      post :upload_image
      delete :delete_image
    end
  end
  resources :users, path: 'user' do
    member do
      patch :toggle_verification
    end
  end

  get 'profile', to: 'profile#index'
  get 'profile/change_password'
  patch 'profile/update_password'
  devise_for :users
  get 'users/:id' => 'users#show'
  get 'home/index'
  root 'home#index'

  get 'confirm_email/:token', to: 'email_handler#confirm_email'

  namespace :api do
    namespace :v2 do
      get 'auth/connection_test'
      post 'auth/login'
      post 'auth/login_with_facebook'
      post 'auth/login_with_google'
      post 'auth/login_with_apple'
      get 'auth/profile'
      delete 'auth/logout'
      post 'auth/register'
      post 'auth/resend_confirmation_email'
      post 'auth/forgot_password'
      post 'auth/resend_forgot_password_code'
      post 'auth/verify_forgot_password_code'
      post 'auth/change_password'
      patch 'profile/update_profile'
      get 'latest_version' => 'version_checker#latest_version'
      
      resources :notifications, only: [:index]

      resources :locations do 
        collection do
          get :regions
          get :provinces
          get :cities
        end
      end
      resources :networks, only: [:index]
      resources :roulettes, only: [:index, :show] do
        member do 
          post :spin_game
        end
        collection do
          get :my_prices
        end
      end
    end
  end
end
