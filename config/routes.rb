Rails.application.routes.draw do
  resources :profiles
  resources :biddings do
    resources :quotations, shallow: true
  end
  resources :tasks
  resources :bank_account_types
  resources :banks
  resources :providers
  resources :menu_items
  resources :phone_types
  resources :cities
  resources :states
  resources :document_types
  resources :categories do
    post :products, on: :member
  end
  resources :responsabilities, only: [:create, :destroy]
  resources :entry_descriptions, only: [:create]
  resources :products do
    get :lots, on: :member
    post :lots, on: :member
  end
  resources :users do
    get :remove_role, on: :member
    post :add_role, on: :member
  end
  resources :units do
    resources :lots, shallow: true do
      get :out, on: :collection
    end
    resources :entries, shallow: true do
      get :in, on: :collection
      get :out, on: :collection
    end
    resources :contracts, shallow: true
  end
  resources :orders do
    get :in, on: :member
    get :pay, on: :member
  end
  devise_for :users, path: 'auth'
      root to: 'home#index'
  # devise_scope :user do
  #   authenticated :user do
  #     root to: 'home#index'
  #   end

  #   unauthenticated do
  #     root to: 'devise/sessions#new'
  #   end
  # end
  get 'home/index'
  post 'utils/zipcode'
end
