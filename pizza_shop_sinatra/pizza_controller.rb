require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

# INDEX - READ
get '/pizzas' do 
  @pizzas = Pizza.all()
  erb(:index)
end

# NEW - CREATE
get '/pizzas/new' do 
  erb(:new)
end

# UPDATE - POST/PATCH/PUT
post '/pizzas/:id' do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
end

# SHOW - READ
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

# CREATE - CREATE
post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

# DESTROY - POST/DELETE
post '/pizzas/:id/delete' do
  @pizza = Pizza.find(params[:id])
  @pizza.delete()
  erb(:destroy)
  # redirect '/pizzas'
end

# delete '/pizzas/:id/delete' do #delete action
#   @pizza = Pizza.find(params[:id])
#   @pizza.delete()
#   redirect to '/pizzas'
# end

# EDIT - POST/PATCH/PUT
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end

patch '/pizzas/:id' do #edit action
  @pizza = Pizza.find(params[:id])
  @pizza.first_name() = params[:first_name]
  @pizza.last_name() = params[:last_name]
  @pizza.topping() = params[:topping]
  @pizza.quantity() = params[:quantity]
  @pizza.save()
  redirect "/pizzas/#{@pizza.id()}"
end

