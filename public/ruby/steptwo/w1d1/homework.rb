# Compound Words
#
# Define a method, #compound_words?(word_list, target), that accepts 2 arguments:
# an array of words and a target, compound word. Check to see if any two words
# in the list can be combined to make the compound word. Don't double-use words.


def compound_words?(array, target)
  #
  # your code here
  #
  is_compounded = false
  i = 0
  while i < array.length
    j = 0
    while j < array.length
      if i != j
        if array[i] + array[j] == target
          is_compounded = true
        end
      end
      j += 1
    end
    i += 1
  end
  is_compounded
end

puts "------Compound Words------"
puts (compound_words?(%w[ice cream], "icecream"))
puts compound_words?(%w[cake candle cup wish], "cupcake")
puts compound_words?(%w[hello bye greetings], "byebye")
puts compound_words?(%w[bye bye greetings], "byebye")
