require_relative('../db/sql_runner')
require('pry-byebug')

class Country

  attr_reader :id
  attr_accessor :name, :continent, :visited, :total_rate


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @continent = options['continent']
    @visited = options['visited'].to_i
    @total_rate = options['total_rate'].to_f
  end

#  SAVE A NEW COUNTRY
  def save()
    sql = "INSERT INTO countries (name, continent, visited, total_rate) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @continent, @visited, @total_rate]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

# UPDATE COUNTRY
  def update()
    sql = "UPDATE countries SET (name, continent, visited, total_rate) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @continent, @visited, @total_rate, @id]
    SqlRunner.run(sql, values)
  end

#  DELETE COUNTRY
  def delete()
    sql = "DELETE FROM countries WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


# FIND CITIES BY COUNTRY
  def cities()
    sql = "SELECT cities.* FROM cities WHERE country_id = $1"
    values = [@id]
    cities = SqlRunner.run(sql, values)
    result = City.map_items(cities)
    return result
  end

  # CITIES RATE
  def cities_rate()
    cities = cities()
    total_rate = 0.00
      for city in cities
        total_rate += city.rate
      end
    total = total_rate / cities.count
    @total_rate = total.round(2)
    update()
  end

# SHOW ALL COUNTRIES
  def self.all()
    sql = "SELECT * FROM countries"
    all_countries = SqlRunner.run(sql)
    countries = map_items(all_countries)
    return countries
  end


# FIND COUNTRY BY ID
  def self.find_by_id(id)
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Country.new(result)
    return country
  end

#  FIND VISITED CITIES FOR A COUNTRY
def find_all_visited_cities()
    all_cities = cities()
    visited_cities = []
    for city in all_cities
      if city.visited == 1
        visited_cities.push(city)
      end
    end
    return visited_cities
end

def count_visited_cities()
  return find_all_visited_cities().count
end


# COUNT NOT VISITED CITIES

  def find_all_non_visited_cities
    all_cities = cities()
      non_visited = []
      for city in all_cities
        if city.visited == 0
          non_visited.push(city)
        end
      end
      return non_visited
  end

  def count_non_visited_cities()
      return find_all_non_visited_cities().count
  end


# VISITED COUNTRIES
  def self.visited_countries()
    sql = "SELECT * FROM countries WHERE visited = $1"
    values = [1]
    all_countries = SqlRunner.run(sql, values)
    countries = Country.map_items(all_countries)
    return countries
  end


# NON VISITED COUNTRIES
    def self.non_visited_countries()
      sql = "SELECT * FROM countries WHERE visited = 0"
      all_countries = SqlRunner.run(sql)
      countries = Country.map_items(all_countries)
      return countries
    end

# SAME CONTINENT COUNTRIES
  def self.continents(continent)
        sql = "SELECT * FROM countries WHERE continent = $1"
        value = [continent]
        all_countries = SqlRunner.run(sql, value)
        countries = Country.map_items(all_countries)
        return countries
    end

    # CONTINENTS THAT HAVE CITIES
      def self.all_continents
            sql = "SELECT DISTINCT continent FROM countries;"
            all_continents = SqlRunner.run(sql)
            continents = Country.map_items(all_continents)
            return continents
        end



# DELETE ALL COUNTRIES
  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end


# MAP ALL ITEMS
  def self.map_items(data)
    return data.map { |country| Country.new(country) }
  end


end
