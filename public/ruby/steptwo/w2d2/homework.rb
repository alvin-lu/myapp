# Pet Types
#
# Define a method, #pet_types, that accepts a hash as an argument.
# The hash uses people's names as keys, and the values are arrays of pet types
# that the person owns.
#
# Example input:
#
# { "yi" => ["dog", "cat"],
#   "cai" => ["dog", "cat", "mouse"],
#   "venus" => ["mouse", "pterodactyl", "chinchilla", "cat"]
# }
#
# The method should return a hash that uses the pet types as keys and the
# values should be a list of the people that own that pet type.
# The names in the output hash should be sorted alphabetically.
#
# Example output:
#
# output_3 =  {
#   "dog" => ["cai", "yi"],
#   "cat" => ["cai", "venus", "yi"],  --->  (sorted alphabetically!)
#   "mouse" => ["cai", "venus"],
#   "pterodactyl" => ["venus"],   "chinchilla" => ["venus"]
# }

def pet_types(owners_hash)
  # stating that the values for each key is an array of owners
  pets_hash = Hash.new do |key, value|
    key[value] = Array.new
  end
  # saves the pets as keys in pets_hash
  owners_hash.each do |pet|
    pet[1].each do |pet|
      pets_hash[pet] = Array.new
    end
  end
  # for each owner
  owners_hash.each do |owner, pets|
    # for each pet
    pets_hash.each do |pet, owners|
      # if the owner owns the pet
      if owners_hash[owner].include?(pet)
        # that pet owns the owner
        pets_hash[pet].push(owner)
      end
    end
  end
  # sorts the owners in alphabetical order
  pets_hash.values.each do |owners|
    # the bang changes the original
    owners.sort!
  end
  pets_hash
end

puts "-------Pet Types-------"

owners_1 = {
  "yi" => ["cat"]
}
output_1 = {
  "cat" => ["yi"]
}

owners_2 = {
  "yi" => ["cat", "dog"]
}
output_2 = {
  "cat" => ["yi"],
  "dog" => ["yi"]
}

owners_3 = {
  "yi" => ["dog", "cat"],
  "cai" => ["dog", "cat", "mouse"],
  "venus" => ["mouse", "pterodactyl", "chinchilla", "cat"]
}
output_3 = {
  "dog" => ["cai", "yi"],
  "cat" => ["cai", "venus", "yi"],
  "mouse" => ["cai", "venus"],
  "pterodactyl" => ["venus"],
  "chinchilla" => ["venus"]
}

puts pet_types(owners_1) == output_1
puts pet_types(owners_2) == output_2
puts pet_types(owners_3) == output_3
