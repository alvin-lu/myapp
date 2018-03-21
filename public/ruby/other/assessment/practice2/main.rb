# Given an array of words, remove all the occurrences of the letter 'a' in those words and return the resulting array.
def remove_letter_a(words)
  letter_gone = Array.new

  words.each do |word|

    new_word = ''

    word.split('').each do |letter|
      if letter != 'a'
        new_word += letter
      end
    end

    letter_gone.push(new_word)
  end

  letter_gone
end

# An abundant number is less than the sum of its divisors, not including itself. 12's divisors are 1, 2, 3, 4, 6, which sum to 16. xw16 > 12 so 12 is an abundant number.
# Write a method that, given a number, returns a boolean indicating whether that number is abundant.
def abundant?(num)
  sum_of_factors = 0
  factors = Array.new

  i = 1
  while i < num
    if num % i == 0
      factors.push(i)
    end
    i += 1
  end

  factors.each do |number|
    sum_of_factors += number
  end

  if num < sum_of_factors
    true
  else
    false
  end
end

# Return the greatest number that's a factor of both inputs.
# greatest_common_factor(6, 10) => 2
# greatest_common_factor(10, 15) => 5
def greatest_common_factor(first_number, second_number)
  gcf = 1

  first_factors = Array.new
  second_factors = Array.new

  i = 1
  while i < first_number
    if first_number % i == 0
      first_factors.push(i)
    end
    i += 1
  end

  i = 1
  while i < second_number
    if second_number % i == 0
      second_factors.push(i)
    end
    i += 1
  end

  first_factors.each do |el1|
    second_factors.each do |el2|
      if el1 == el2
        gcf = el1
      end
    end
  end
  gcf
end

# Write a method that, given a sentence without punctuation or capitalization, returns the word with the greatest number of repeated letters. Return the first word if there's a tie. It doesn't matter how often individual letters repeat, just that they repeat.
# word_with_most_repeats("I took the road less traveled and that has made all the difference") => "difference" because "difference" has two repeated letters, more than the other words.
def word_with_most_repeats(sentence)
  sentence_hash = Hash.new(0)
  sentence.split(' ').each do |word|

    letter_hash = Hash.new(0)

    word.split('').each do |letter|
      if letter_hash.key?(letter)
        letter_hash[letter] += 1
      else
        letter_hash[letter] = 1
      end
    end

    sentence_hash[word] = letter_hash.values.sort.reverse[0]

  end

  repeat_letter = ''
  repeat_value = 0

  sentence_hash.each do |key, value|
    if value > repeat_value
      repeat_value = value
      repeat_letter = key
    end
  end

  repeat_letter
end

require_relative 'test.rb'