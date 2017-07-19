Rails.application.routes.draw do

  root to: redirect('users/login')

  get '/tasks' => "tasks#index"

  get '/tasks/new'=> "tasks#new"

  post '/tasks' => "tasks#create"

  get '/tasks/:id' => "tasks#update"

  

  get '/users/login' => 'users#new'

  post '/users' => 'users#create'

  get '/users/logout' => 'users#logout'

  post '/users/login' => 'users#authenticate'

end
