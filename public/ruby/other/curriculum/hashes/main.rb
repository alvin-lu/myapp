# EASY

# Define a method that, given a sentence, returns a hash of each of the words as keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  word_hash = Hash.new(0)
  str.split(' ').each {|word| word_hash[word] = word.length}
  word_hash
end

# Define a method that, given a hash with integers as values, returns the key with the largest value.
def greatest_key_by_val(hash)
  greatest = hash.values.sort[hash.length - 1]
  hash.each do |key, value|
    if value == greatest
      return key
    end
  end
end

# Define a method that accepts two hashes as arguments: an older inventory and a newer one. The method should update keys in the older inventory with values from the newer one as well as add new key-value pairs to the older inventory. The method should return the older inventory as a result.
# march = {rubies: 10, emeralds: 14, diamonds: 2}
# april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5}
def update_inventory(older, newer)
  new_hash = older

  newer.each do |key, value|
      new_hash[key] = value
  end

  new_hash
end

# Define a method that, given a word, returns a hash with the letters in the word as keys and the frequencies of the letters as values.  the counts of each letter
def letter_counts(word)
  word_hash = Hash.new
  word.split('').count do |letter|
    if !word_hash.has_key?(letter)
      word_hash[letter] = 1
    elsif word_hash.has_key?(letter)
      word_hash[letter] += 1
    end
  end
  word_hash
end


# MEDIUM

# Define a method that, given an array, returns its argument without duplicates. Use a hash! Don't use the uniq method.
def uniq(arr)
  arr_hash = Hash.new
  arr.each do |number|
    arr_hash[number] = 0
  end
  arr_hash.keys
end

# Define a method that, given an array of numbers, returns a hash with "even" and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  num_hash = {"even" => 0, "odd" => 0}
  numbers.each do |num|
    if num % 2 == 0
      num_hash["even"] += 1
    else
      num_hash["odd"] += 1
    end
  end
  num_hash
end

# Define a method that, given a string, returns the most common vowel. If there's a tie, return the vowel that occurs earlier in the alphabet. Assume all letters are lower case.
def most_common_vowel(string)
  vowels = %w[
    a e i o u
  ]
  vowel_hash = {"a" => 0, "e" => 0, "i" => 0, "o" => 0, "u" => 0}
  string.downcase.split('').sort.each do |letter|
    if vowels.include?(letter)
      vowel_hash[letter] += 1
    end
  end
  recurr = vowel_hash.values.sort.reverse[0]
  vowel_hash.each do |key, value|
    if value == recurr
      return key
    end
  end
end


# HARD

# Define a method that, given a hash with keys as student names and values as their birthday months (numerically, e.g., 1 corresponds to January), returns every combination of students whose birthdays fall in the second half of the year (months 7-12).
# students_with_birthdays = {
#   "Asher" => 6,
#   "Bertie" => 11,
#   "Dottie" => 8,
#   "Warren" => 9
# }
# fall_and_winter_birthdays(students_with_birthdays) => [
#   ["Bertie", "Dottie"],
#   ["Bertie", "Warren"],
#   ["Dottie", "Warren"]
# ]
def fall_and_winter_birthdays(students_with_birthdays)
  birthdays = students_with_birthdays.select {|key, value| key if value > 6}.keys
  combinations = Array.new
  i = 0
  while i < birthdays.length
    j = i + 1
    while j < birthdays.length
      combinations.push([birthdays[i], birthdays[j]])
      j += 1
    end
    i += 1
  end
  combinations
end

# Define a method that, given an array of specimens, returns the biodiversity index as defined by the following formula:
# number_of_species**2 * smallest_population_size / largest_population_size
# biodiversity_index(["cat", "cat", "cat"]) => 1
# biodiversity_index(["cat", "leopard-spotted ferret", "dog"]) => 9
def biodiversity_index(specimens)
  specimens_hash = Hash.new(0)

  # parsing through array and counting the amount of each animal
  specimens.each do |animal|
    if specimens_hash.has_key?(animal)
      specimens_hash[animal] += 1
    elsif !specimens_hash.has_key?(animal)
      specimens_hash[animal] = 1
    end
  end

  # finding amount of unique species
  number_of_species = specimens_hash.keys.length
  # finding largest population
  largest_population_size = specimens_hash.values.sort.reverse[0]
  # finding smallest population
  smallest_population_size = specimens_hash.values.sort[0]

  (number_of_species ** 2 * smallest_population_size) / largest_population_size

end

# Define a method that, given the string of a respectable business sign, returns a boolean indicating whether pranksters can make a given vandalized string using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  alphabet_array = %w[
    a b c d e f g h i j k l m n o p q r s t u v w x y z
  ]
  alphabet_hash = Hash.new

  # saving the amount of times the letter in the alphabet occurs into the alphabet_hash
  normal_sign.downcase.split('').each do |letter|
    # if the letter does not exists as a key, create a key for it, if it does exists, add one to it's value
    if !alphabet_hash.include?(letter)
      alphabet_hash[letter] = 1
    else
      alphabet_hash[letter] += 1
    end
  end

  # checking if the letters used in vandalized have the resources to do so from normal
  vandalized_sign.downcase.split('').each do |letter|
    # if hash does not have the key, return false
    if !alphabet_array.include?(letter)
    elsif !alphabet_hash.has_key?(letter)
      return false
    else
      alphabet_hash[letter] -= 1
    end
  end

  true
end


require_relative "test.rb"