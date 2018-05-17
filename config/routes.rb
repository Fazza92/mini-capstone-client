Rails.application.routes.draw do
  get '/' =>'products/'
  namespace :client do
    get '/products' => 'products#index'
    get '/products/new' => 'products#new'
    post '/products' => 'products#create'
    get '/products/:id' => 'products#show'
    get '/products/:id/edit' => 'products#edit'
    patch '/products/:id'Ne => 'products#update'
    delete '/products/:id' => 'products#destroy'
  end
end
