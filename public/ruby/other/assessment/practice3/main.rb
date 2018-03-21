# Define a method that accepts two arguments, a string and an integer.
# The method should return a copy of the string with the letter at the nth index removed.
def remove_nth_letter(string, n)
  removed_letter = ''
  if n > 0
    i = 0
    while i < string.length
      if i != n
        removed_letter += string[i]
      end
      i += 1
    end
  elsif n < 0
    idx = string.length + n
    i = 0
    while i < string.length
      if i != idx
        removed_letter += string[i]
      end
      i += 1
    end

  end

  removed_letter
end

# Define a method that chunks an array into a nested array of sub-arrays of length n.
# The last array may be of length less than n if the original array's size does not divide evenly by n.
# chunk([1,2,3,4,5], 2) => [[1,2], [3,4], [5]]
def chunk(array, n)
  result_array = Array.new
  temp_array = Array.new
  array.each_index do |idx|
    if (idx + 1) % n == 0
      temp_array.push(array[idx])
      result_array.push(temp_array)
      temp_array = Array.new
    else
      temp_array.push(array[idx])
      if (idx + 1) == array.length
        result_array.push(temp_array)
        temp_array = Array.new
      end
    end
  end
  result_array
end

# Define a method that multiplies the frequencies of the periods, commas, hyphens, semicolons, question marks,
# and exclamation points in a given string and returns the product. If any punctuation does not occur,
# don't include it in the product, i.e., don't multiply by zero!
def product_punctuation(str)
  punctuation_hash = Hash.new
  punctuation_array = %w[! . , - ; ?]
  result = 0
  str.split('').each do |letter|
    if punctuation_array.include?(letter)
      result = 1
      if punctuation_hash.key?(letter)
        punctuation_hash[letter] += 1
      else
        punctuation_hash[letter] = 1
      end
    end
  end
  punctuation_hash.values.each do |value|
    result *= value
  end
  result
end

# Translate a sentence into pig-latin! The first consonants go to the end of the word, then add "ay".
def pig_latin(sentence)
  pig_array = Array.new
  vowels = %w[
    a e i o u
  ]
  sentence.split(' ').each do |word|

    found = false
    vowel_idx = 0
    while !found
      if vowels.include?(word[vowel_idx])
        found = true
      end
      vowel_idx += 1
    end

    if word.length > 1
      if vowel_idx == 1
        pig_array.push(word[(vowel_idx - 1)..-1] + 'ay')
      else
        pig_array.push(word[(vowel_idx - 1)..-1] + word[0..(vowel_idx - 2)] + 'ay')
      end
    else
      pig_array.push(word[0] + 'ay')
    end

  end
  pig_array.join(' ')
end



require_relative 'test.rb'