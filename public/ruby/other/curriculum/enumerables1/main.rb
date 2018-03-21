# EASY

# Define a method that returns an array of only the even numbers in its argument (an array of integers).
def get_evens(arr)
  even_array = []
  arr.each{|int| even_array.push(int) if int % 2 == 0}
  even_array
end

# Define a method that returns a new array of all the elements in its argument doubled. This method should *not* modify the original array.
def calculate_doubles(arr)
  doubled_array = []
  arr.each {|int| doubled_array.push(int * 2)}
  doubled_array
end

# Define a method that returns its argument with all the argument's elements doubled. This method should modify the original array.
def calculate_doubles!(arr)
  arr.map! {|int| int * 2}
end

# Define a method that returns the sum of each element in its argument multiplied by its index.
# array_sum_with_index([2, 9, 7]) => 23 because (2 * 0) + (9 * 1) + (7 * 2) = 0 + 9 + 14 = 23
def array_sum_with_index(arr)
  acc = 0
  arr.each_with_index {|int, id| acc += (int * id)}
  acc
end

# MEDIUM

# Given an array of bids and an actual retail price, return the bid closest to the actual retail price without going over that price. Assume there is always at least one bid below the retail price.
def price_is_right(bids, actual_retail_price)
  winning_bid = 0
  bids.each {|current_bids| winning_bid = current_bids if current_bids < actual_retail_price && current_bids > winning_bid}
  winning_bid
end

# Given an array of numbers, return an array of those numbers that have at least n factors (including 1 and the number itself as factors).
# at_least_n_factors([1, 3, 10, 16], 5) => [16] because 16 has five factors (1, 2, 4, 8, 16) and the others have fewer than five factors.
# Consider writing a helper method num_factors
def at_least_n_factors(numbers, n)
  arr = []
  numbers.each {|number| arr.push(number) if num_factors(number) >= n}
  arr
end

def num_factors(number)
  num_of_factors = 0
  i = 1
  while i <= number
    if number % i == 0
      num_of_factors += 1
    end
    i += 1
  end
  num_of_factors
end

# HARD

# Define a method that accepts an array of words and returns an array of those words whose vowels appear in order. You may wish to write a helper method: ordered_vowel_word?
def ordered_vowel_words(words)
  words.select {|word| ordered_vowel_word?(word)}
end

def ordered_vowel_word?(word)
  vowels = %w[
    a e i o u
  ]

  stripped_consanants = ''

  word.split('').each do |letter|
    if vowels.include?(letter)
      stripped_consanants += letter
    end
  end

  i = 1
  while i < stripped_consanants.length
    if stripped_consanants[i] < stripped_consanants[i - 1]
      return false
    end
    i += 1
  end
  true
end

# Given an array of numbers, return an array of all the products remaining when each element is removed from the array.
# You may wish to write a helper method: array_product.

# products_except_me([2, 3, 4]) => [12, 8, 6], where:
#   12 because you take out 2, leaving 3 * 4
#   8, because you take out 3, leaving 2 * 4
#   6, because you take out 4, leaving 2 * 3

# products_except_me([1, 2, 3, 5]) => [30, 15, 10, 6], where:
#   30 because you take out 1, leaving 2 * 3 * 5
#   15, because you take out 2, leaving 1 * 3 * 5
#   10, because you take out 3, leaving 1 * 2 * 5
#   6, because you take out 5, leaving 1 * 2 * 3
def products_except_me(numbers)
  sum_of_products = []
  i = 0
  while i < numbers.length
    product_array = []
    j = 0
    while j < numbers.length
      if i != j
        product_array.push(numbers[j])
      end
      j += 1
    end
    sum_of_products.push(array_product(product_array))
    i += 1
  end
  sum_of_products
end

def array_product(array)
  sum = 1
  i = 0
  while i < array.length
    sum *= array[i]
    i += 1
  end
  sum
end

require_relative 'test.rb'