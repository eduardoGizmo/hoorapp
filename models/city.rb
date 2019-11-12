require_relative('../db/sql_runner')
require( 'pry-byebug' )

class City

  attr_reader :id
  attr_accessor :name, :country_id, :visited, :rate

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @country_id = options['country_id'].to_i
    @visited = options['visited'].to_i
    @rate = options['rate'].to_i
  end

#  SAVE ENTRY FOR CITY
  def save()
    sql = "INSERT INTO cities (name, country_id, visited, rate) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@name, @country_id, @visited, @rate]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

# UPDATE ENTRY FOR CITY
  def update()
    sql = "UPDATE cities SET(name, country_id, visited, rate) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @country_id, @visited, @rate, @id]
    SqlRunner.run(sql, values)
  end

# DELETE CITY
    def delete()
      sql = "DELETE FROM cities WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

# FIND COUNTRY BY CITY
      def country()
        country = Country.find_by_id(@country_id)
        return country
      end


# SHOW ALL CITIES
    def self.all()
      sql = "SELECT * FROM cities"
      all_cities = SqlRunner.run(sql)
      cities = map_items(all_cities)
      return cities
    end

# FIND CITIE BY ID
    def self.find_by_id(id)
        sql = "SELECT * FROM cities WHERE id = $1"
        values = [id]
        result = SqlRunner.run(sql, values).first
        city = City.new(result)
        return city
    end

# FIND VISITED CITIES
    def self.visited_cities()
      sql = "SELECT * FROM cities WHERE visited = 1"
      all_cities = SqlRunner.run(sql)
      cities = map_items(all_cities)
      return cities
    end

# VISITED CITIES FOR A SPECIFIC COUNTRY

   def just_visited()
     all_visited_cities = Country.visited_cities
     all_visited_cities.each {|city| City.new(city) }
   end


# FIND VISITED CITIES
    def self.non_visited_cities()
      sql = "SELECT * FROM cities WHERE visited = 0"
      all_cities = SqlRunner.run(sql)
      cities = map_items(all_cities)
      return cities
    end


# MAP ALL ITEMS
    def self.map_items(data)
        return data.map { |city| City.new(city) }
    end


# DELETE ALL ELEMENTS FROM TABLE CITIES
  def self.delete_all()
    sql = "DELETE FROM cities"
    SqlRunner.run(sql)
  end


end
