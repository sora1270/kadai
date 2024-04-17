Rails.application.routes.draw do

  resources :books, except: [:destroy, :edit]


  delete '/books/:id', to: 'books#destroy', as: 'destroy_book'

  get '/books/:id/edit', to: 'books#edit', as: 'edit_book_custom'
  
  root 'pages#top'

end