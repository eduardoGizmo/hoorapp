require_relative('../db/sql_runner')


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


# SHOW ALL COUNTRIES
  def self.all()
    sql = "SELECT * FROM countries"
    all_countries = SqlRunner.run(sql)
    countries = map_items(all_countries)
    return countries
  end

# FIND COUNTRY BY ID
  def self.find(id)
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Country.new(result)
    return country
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
