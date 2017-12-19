require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:test.sqlite3"

require_relative('models/dog')
require_relative('models/owner')

post '/dogs' do
	Dog.create(name: params[:name], owner_id: params[:owner])
end

get '/dogs/new' do 
	erb :new_dog
end


get '/dogs' do 
	@dogs = Dog.all
	erb :index
end

get '/dogs/:id/edit' do
	@dog = Dog.find(params[:id])
	erb :edit_dog
end

put '/dogs/:id' do 
  puts 'IM IN THIS ROUTE'
  @dog = Dog.find(params[:id]) 
  @dog.update(name: params[:name], owner_id: params[:owner_id]) 
  @dog.save 
  redirect '/dogs'
end

delete '/dogs/:id' do
	@dog = Dog.find(params[:id])
	@dog.destroy
	redirect '/dogs'
end
