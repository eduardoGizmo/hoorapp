require( 'pry-byebug' )
require_relative('../models/country.rb')


Country.delete_all()

country1 = Country.new('name' => 'Spain', 'continent' => 'Europe', 'total_rate' => 0)
country2 = Country.new('name' => 'France', 'continent' => 'Europe', 'total_rate' => 0)
country3 = Country.new('name' => 'Italy', 'continent' => 'Europe', 'total_rate' => 0)
country4 = Country.new('name' => 'Sweden', 'continent' => 'Europe', 'total_rate' => 0)
country5 = Country.new('name' => 'Greece', 'continent' => 'Europe', 'total_rate' => 0)
country6 = Country.new('name' => 'Portugal', 'continent' => 'Europe', 'total_rate' => 0)


country1.save()
country2.save()
country3.save()
country4.save()
country5.save()
country6.save()


binding.pry
nil
