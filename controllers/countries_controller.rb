require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('../models/*')




get '/countries/index' do
  @countries = Country.all()
  erb ( :"countries/index" )
end

# get '/countries/:id' do
#   @country = Country.find_by_id(params['id'].to_i)
#   erb (:'countries/country')
# end

get '/new_country' do
  @countries = Country.all()
  erb ( :"countries/new_country" )
end

post '/countries' do
  Country.new(params).save
  redirect to '/countries/index'
end


get '/countries/visited_countries' do
  @countries = Country.visited_countries()
  erb ( :"countries/visited_countries" )
end

get '/countries/non_visited_countries' do
  @countries = Country.non_visited_countries()
  erb ( :"countries/non_visited_countries" )
end
