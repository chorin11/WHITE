Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:'admins/sessions',
    passwords:'admins/passwords',
    registrations:'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:'users/sessions',
    passwords:'users/passwords',
    registrations:'users/registrations'
  }

  resources :homes, only: [:top, :about]
  resources :users, only: [:show, :edit, :update] do
    member do
      get :withdraw
      put :withdraw_done
    end
  end

  resources :post_images do
    resource :favirites, only: [:create, :destroy]
    resources :post_comments, onry: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
