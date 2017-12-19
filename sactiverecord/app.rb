require 'sinatra'
require 'sinatra/activerecord'

set :database, "sqlite3:test.sqlite3"

require_relative('models/house')
require_relative('models/character')


get '/houses' do 
	@houses = House.all
	erb :houses
end

get '/characters' do 
	@chars = Character.all
	erb :characters
end

#Add new character
post '/characters' do 
	Character.create(name: params[:name], house_id: params[:house_id], image_url: params[:image_url])
	redirect '/characters'
end

#add new house
post '/houses' do 
	Houses.create(name: params[:name], sigil_url: params[:sigil_url], region: params[:region])
	redirect '/houses'
end


get '/characters/:id/edit' do 
	@char = Character.find(params[:id])
	erb :editchar
end

get '/houses/:id/edit' do 
	@house = House.find(params[:id])
	erb :edithouse
end

put '/characters/:id/edit' do 
	@char = Character.find(params[:id])
	@char.update(name: params[:name], house_id: params[:house_id], image_url: params[:image_url])
	@char.save
	redirect '/characters'
end


put '/houses/:id/edit' do 

end


delete '/characters/:id/delete' do 

end

delete '/houses/:id/delete' do
	house = House.find(params[:id])
	house.destroy
	chara = Character.where(house_id: params[:id])
	chara.each do |char| 
		char.destroy
	end
	redirect '/characters'
end



