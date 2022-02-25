Rails.application.routes.draw do
  #
  # root 'pages#index'
  # namespace :api do
  #   namespace :v1 do
  #     resources :categories, param: :genre
  #     resources :books, param: :title
  #     # resources :books, only: [:create, :destroy]
  #   end
  # end
  #
  # get '*path', to: 'pages#index', via: :all

  root 'api/v1/categories#index'
  namespace :api do
      namespace :v1 do
        resources :categories,  param: :genre
        # resources :books, param: :title
        # resources :books, only: [:create, :destroy]
      end
    end

end
