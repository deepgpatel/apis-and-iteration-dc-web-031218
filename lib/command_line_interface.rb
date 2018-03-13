def welcome
  puts "May The Force be with you"
end

def character_names
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  character_hash["results"].map {|hash_result| hash_result["name"].downcase}
end

def get_character_from_user
  puts "Please enter a Character"
  user_input = gets.chomp
  if character_names.include?(user_input)
    user_input
  else
  puts "The Force is not with them"
  exit
  end
end
