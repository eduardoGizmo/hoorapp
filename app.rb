require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( 'controllers/cities_controller.rb')
require_relative( 'controllers/countries_controller.rb')
require_relative( 'controllers/continents_controller.rb')
also_reload('./models/*')


get '/' do
  @total_non_countries = Country.non_visited_countries()
  @total_vis_countries = Country.visited_countries()
  @total_non_cities = City.non_visited_cities()
  @total_vis_cities = City.visited_cities()
  erb(:index)
end
