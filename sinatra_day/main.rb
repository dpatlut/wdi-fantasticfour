require 'sinatra'

get '/' do 
	@x = "Hello"

	erb :home
end

get '/users' do 
	puts "These are my params"
	puts params
	@test = "lkjskdjlasjd"
	erb :users
end 

post '/users' do
  #put some code to create the user
end