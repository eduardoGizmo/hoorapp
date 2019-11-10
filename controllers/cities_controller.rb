require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/city.rb' )
require_relative( '../models/country.rb' )
also_reload( '../models/*' )



# get '/cities/index' do
#   @cities = City.all()
#   erb( :"cities/index" )
# end
#
# get '/cities/visited_cities' do
#   @cities = City.visited_cities()
#   erb( :"cities/visited_cities" )
# end
#
# get '/cities/non_visited_cities' do
#   @cities = City.non_visited_cities()
#   erb( :"cities/non_visited_cities" )
# end
