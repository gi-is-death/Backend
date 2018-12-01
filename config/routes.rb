Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/notice' => 'notice#create'
  get '/notice/:id' => 'notice#read'
  get '/notice/list/:page' => 'notice#paging'
  put '/notice/:id' => 'notice#update'
  delete '/notice/:id' => 'notice#delete'

  get '/study/list/:page' => 'study#paging'
  get '/study/:id' => 'study#read'
  post '/study/:id' => 'study#participate'
  put '/study/:id' => 'study#update'
  get '/study/member/:id' => 'study#members'
  post '/study' => 'study#create'
  delete '/study/:id' => 'study#delete'

end
