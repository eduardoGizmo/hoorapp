require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('../models/*')




get '/countries/index' do
  @countries = Country.all().reverse
  erb ( :"countries/index" )
end

get '/new_country' do
  @countries = Country.all()
  erb ( :"countries/new_country" )
end

post '/countries/new_country' do
  Country.new(params).save
  redirect to '/countries/index'
end

get '/countries/visited_countries' do
  @countries = Country.visited_countries().reverse
  erb ( :"countries/visited_countries" )
end

get '/countries/non_visited_countries' do
  @countries = Country.non_visited_countries().reverse
  erb ( :"countries/non_visited_countries" )
end

get '/countries/:id' do
  country = Country.find_by_id(params[:id].to_i)
  cities = country.cities
  @country = country
  @cities = cities
  @average_rate = country.cities_rate()
  @total_visited = country.count_visited_cities()
  @total_non_visited = country.count_non_visited_cities()
  erb (:'countries/country')
end

get '/countries/:id/edit' do
  @country = Country.find_by_id(params[:id])
  erb(:'countries/edit_country')
end


post '/countries/:id' do
  country = Country.new(params)
  country.update
  redirect to "/countries/#{params['id']}"
end

get '/countries/:id/delete' do
  country = Country.find_by_id(params['id'])
  cities = country.cities
  cities.each {|city| city.delete }
  country.delete
  redirect to "/countries/index"
end
