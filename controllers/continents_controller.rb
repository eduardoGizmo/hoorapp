require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/city.rb')
require_relative('../models/country.rb')
also_reload('../models/*')


get '/continents/index' do
  @countries = Country.all()
  erb ( :"continents/index" )
end


get '/continents/:continent' do
  @continent = params[:continent]
  @countries = Country.continents(params[:continent])
  erb ( :"continents/continent" )
end
