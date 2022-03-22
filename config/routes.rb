# frozen_string_literal: true

Rails.application.routes.draw do
  # root 'pages#index'
  root 'categories#index'
  # namespace :api do
  #   namespace :v1 do
  #     resources :categories, only: [:create, :destroy, :show, :index] do
  #       resources :books
  #     end
  #     # resources :categories, param: :genre
  #     # resources :books, param: :title
  #     # resources :books, only: [:create, :destroy]
  #   end
  # end

  # get '*path', to: 'pages#index', via: :all

  #  root 'api/v1/categories#index'
  # # resources :categories, param: :genre
  # get "/categories/create", to: "api/v1/categories#create"
  # get "/categories/:genre", to: "api/v1/categories#show"

  resources :categories, shallow: true
  resources :books, param: :category_id
  resources :line_items, shallow: true
  resources :carts
end
