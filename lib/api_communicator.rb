require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_name = character_hash["results"].find {|hash_result| hash_result["name"].downcase == character}
  films_var = character_name["films"]
  films_var.map do |film_url|
    star_wars = RestClient.get(film_url)
    star_hash = JSON.parse(star_wars)
    star_hash['title']
  end
end

def parse_character_movies(films_hash)
  puts films_hash
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
