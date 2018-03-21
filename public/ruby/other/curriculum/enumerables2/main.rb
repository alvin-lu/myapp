# EASY

# Define a method that returns the sum of all the elements in its argument (an array of numbers).
def array_sum(arr)
  sum = 0
  arr.each {|int| sum += int}
  sum
end

# Define a method that returns a boolean indicating whether substring is a substring of all the long_strings (an array).
def in_all_strings?(long_strings, substring)
  long_strings.all? {|string| true if string.include?(substring)}
end

# Define a method that accepts a string of lower case words (no punctuation) and returns an array of letters that occur more than once.
def non_unique_letters(string)
  split_string = string.split('').uniq
  split_string.select {|char| string.count(char) > 1}
end

# Define a method that returns an array of the longest two words (in order) in the method's argument. Ignore punctuation!
def longest_two_words(string)
  split_string = string.delete(',.').split(' ').sort_by {|word| word.length}
  split_string[split_string.length - 2..split_string.length - 1]
end


# MEDIUMs

# Define a method that returns an array of letters that do not occur in the method's argument.
def missing_letters(string)
  alphabet = ('a'..'z')
  alphabet.reject {|letter| string.downcase.include?(letter)}
end

# Define a method that accepts two years and returns an array of the years within that range (inclusive) that have no repeated digits. Hint: helper method?
def no_repeat_years(first_yr, last_yr)
  years = (first_yr..last_yr).to_a
  unrepeated_years = Array.new
  years.each do |yr|
    if not_repeat_year?(yr)
      unrepeated_years.push(yr)
    end
  end
  unrepeated_years
end

def not_repeat_year?(year)
  year.to_s.split('').each_index do |i|
    year.to_s.split('').each_index do |j|
      next if i == j
      if year.to_s[i] == year.to_s[j]
        return false
      end
    end
  end
  true
end


# HARD

# Define a method that, given an array of songs at the top of the charts, returns the songs that only stayed on the chart for a week at a time. Each element corresponds to a song at the top of the charts for one particular week.
# Songs CAN reappear on the chart, but if they don't appear in consecutive weeks, they're "one-week wonders."
# Suggested strategy: find the songs that appear multiple times in a row and remove them.
# You may wish to write a helper method no_repeats?
def one_week_wonders(songs)
  unrepeated_song_array = Array.new
  songs.uniq.each do |title|
    if no_repeats?(title, songs)
      unrepeated_song_array.push(title)
    end
  end
  unrepeated_song_array
end

def no_repeats?(song_name, songs)
  songs.each_index do |i|
    if songs[i] == songs[i + 1]
      if songs[i] == song_name
        return false
      end
    end
  end
  true
end


# Define a method that, given a string of words, returns the word that has the letter "c" closest to the end of it. If there's a tie, return the earlier word. Ignore punctuation. If there's no "c", return an empty string. You may wish to write the helper methods c_distance and remove_punctuation.
def for_cs_sake(string)
  string_array = string.gsub(/[^a-z0-9\s]/, '').split
  string_with_c = Array.new
  string_array.each do |word|
    if word.include?('c')
      string_with_c.push(word)
    end
  end
  # p string_with_c
  c_word = ''
  closest_distance = 100
  string_with_c.each do |word|
    if c_distance(word) < closest_distance
      closest_distance = c_distance(word)
      c_word = word
    end
  end
  c_word
end

def c_distance(word)
  last_c_position = 0
  word.split('').each_with_index do |letter, idx|
    if letter.include?('c')
      last_c_position = idx
    end
  end
  word.length - last_c_position
end


# Define a method that, given an array of numbers, returns a nested array of two-element arrays that each contain the start and end indices of whenever a number appears multiple times in a row.
# repeated_number_ranges([1, 1, 2]) => [[0, 1]]
# repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]
def repeated_number_ranges(arr)
  result = Hash.new
  start_point = nil
  end_point = nil
  current_value = nil

  arr.each_with_index do |value, i|
    if value != current_value
      current_value = value
      start_point = i
      end_point = i
    elsif value == current_value
      end_point = i
    end
    result[start_point] = end_point
  end

  # delete keys that equal to their array
  result.delete_if {|key, value| key == value}
  result.to_a
end

require_relative "test.rb"