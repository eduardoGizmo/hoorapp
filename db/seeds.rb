require( 'pry-byebug' )
require_relative('../models/country.rb')
require_relative('../models/city.rb')




City.delete_all()
Country.delete_all()



# SEED SHEET FOR COUNTRIES
# #####################################


country1 = Country.new(
  'name' => 'Spain', 'continent' => 'Europe', 'visited' => 1, 'total_rate' => 0.0)
country2 = Country.new(
  'name' => 'France', 'continent' => 'Europe', 'visited' => 0, 'total_rate' => 0.0)
country3 = Country.new(
  'name' => 'Italy', 'continent' => 'Europe', 'visited' => 1, 'total_rate' => 0.0)
country4 = Country.new(
  'name' => 'Sweden', 'continent' => 'Europe', 'visited' => 0,'total_rate' => 0.0)
country5 = Country.new(
  'name' => 'Greece', 'continent' => 'Europe', 'visited' => 0, 'total_rate' => 0.0)
country6 = Country.new(
  'name' => 'Portugal', 'continent' => 'Europe', 'visited' => 0, 'total_rate' => 0.0)
country7 = Country.new(
    'name' => 'Japan', 'continent' => 'Asia', 'visited' => 1, 'total_rate' => 0.0)
country8 = Country.new(
    'name' => 'India', 'continent' => 'Asia', 'visited' => 1, 'total_rate' => 0.0)
country9 = Country.new(
    'name' => 'Mali', 'continent' => 'Africa', 'visited' => 1, 'total_rate' => 0.0)
country10 = Country.new(
    'name' => 'Morocco', 'continent' => 'Africa', 'visited' => 1, 'total_rate' => 0.0)


country1.save()
country2.save()
country3.save()
country4.save()
country5.save()
country6.save()
country7.save()
country8.save()
country9.save()
country10.save()

# SEED SHEET FOR CITIES
# #####################################


city1 = City.new(
  'name' => 'Madrid', 'country_id' => country1.id, 'visited' => 0, 'total_rate' => 0)
city2 = City.new(
  'name' => 'Paris', 'country_id' => country2.id, 'visited' => 1, 'total_rate' => 0)
city3 = City.new(
  'name' => 'Roma', 'country_id' => country3.id, 'visited' => 0, 'total_rate' => 0)
city4 = City.new(
  'name' => 'Stockholm', 'country_id' => country4.id, 'visited' => 1, 'total_rate' => 0)
city5 = City.new(
  'name' => 'Athems', 'country_id' => country5.id, 'visited' => 0, 'total_rate' => 0)
city6 = City.new(
  'name' => 'Lisbon', 'country_id' => country6.id, 'visited' => 1, 'total_rate' => 0)
city7 = City.new(
  'name' => 'Huesca', 'country_id' => country1.id, 'visited' => 0, 'total_rate' => 0)
city8 = City.new(
  'name' => 'Lisbon', 'country_id' => country1.id, 'visited' => 1, 'total_rate' => 0)
city9 = City.new(
  'name' => 'Lisbon', 'country_id' => country1.id, 'visited' => 0, 'total_rate' => 0)
city10 = City.new(
  'name' => 'Lisbon', 'country_id' => country1.id, 'visited' => 1, 'total_rate' => 0)


city1.save()
city2.save()
city3.save()
city4.save()
city5.save()
city6.save()
city7.save()
city8.save()
city9.save()
city10.save()



#
# binding.pry
# nil
