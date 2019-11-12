require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )
also_reload( '../models/*' )


# SHOW ALL CITIES
get '/cities/index' do
  @cities = City.all()
  erb( :"cities/index" )
end

# ADD NEW CITY
get '/new_city' do
  @city= City.all()
  @countries= Country.all()
  erb ( :"cities/new_city" )
end

post '/cities/new_city' do
  city = City.new(params)
  city.save
  country = Country.find_by_id(city.country_id)
  country.cities_rate()
  # country.update
  redirect to "/cities/#{city.id}"
end


# ADD NEW CITY FROM COUNTRY PAGE
get '/new_city/:id' do
  @city = City.all()
  @country = Country.find_by_id(params[:id])
  erb ( :"cities/new_city_id" )
end





get '/cities/visited_cities' do
  @cities = City.visited_cities()
  erb( :"cities/visited_cities" )
end

get '/cities/non_visited_cities' do
  @cities = City.non_visited_cities()
  erb( :"cities/non_visited_cities" )
end

#  DELETE CITY

get '/cities/:id/delete' do
  city = City.find_by_id(params[:id])
  city.delete
  redirect to "/countries/#{city.country_id}"
end


get '/cities/:id' do

  @city = City.find_by_id(params[:id].to_i)
  @country = @city.country
  erb ( :"cities/city" )
end

# EDIT CITY
get '/cities/:id/edit' do
  @city = City.find_by_id(params[:id].to_i)
  @countries = Country.all()
  erb( :"cities/edit_city")
end

post '/cities/:id' do
  city = City.new(params)
  city.update
  redirect to "/cities/#{params['id']}"
end
