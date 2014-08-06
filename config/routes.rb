Rails.application.routes.draw do
  # Routes for the Question resource:
  # CREATE
  get '/new_question' => 'questions#new'
  get '/create_question' => 'questions#create'

  # READ
  get '/questions' => 'questions#index'
  get '/questions/:id' => 'questions#show'

  # UPDATE
  get '/questions/:id/edit' => 'questions#edit'
  get '/questions/:id/update' => 'questions#update'

  # DELETE
  get '/questions/:id/destroy' => 'questions#destroy'
  #------------------------------

  # Routes for the User resource:
  # CREATE
  get '/new_user' => 'users#new'
  get '/create_user' => 'users#create'

  # READ
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'

  # UPDATE
  get '/users/:id/edit' => 'users#edit'
  get '/users/:id/update' => 'users#update'

  # DELETE
  get '/users/:id/destroy' => 'users#destroy'
  #------------------------------
  get '/griffendor' => 'houses#griffendor'
  get '/hufflepuff' => 'houses#hufflepuff'
  get '/ravenclaw' => 'houses#ravenclaw'
  get '/slytheryn' => 'houses#slytheryn'
  get '/session/new' => 'sessions#new'
  get '/session/create' => 'sessions#create'
  get '/session/destroy' => 'sessions#destroy'
  get '/home' => 'application#home'
  get '/quiz' => 'application#quiz'
  get '/processing' => 'application#processing'
  root 'application#home'
end
