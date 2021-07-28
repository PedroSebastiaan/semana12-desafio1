Rails.application.routes.draw do
  get 'books', to: 'books#index'
  root 'books#index'

  get 'books/new'
  post 'books', to: 'books#create'

  get 'books/:id', to: 'books#show', as: 'book'

  get 'books/:id/edit', to: 'books#edit', as: 'book_edit'
  patch 'books/:id', to: 'books#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
