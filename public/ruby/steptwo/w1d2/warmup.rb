

def vowel_censor(string)
  str = string.split("")
  vowels = %w[a e i o u]
  censored = str.map do |letter|
    if vowels.include?(letter)
      letter = "X"
    else
      letter = letter
    end
  end
  censored.join
end

puts "---------Vowel Censor----------"
puts vowel_censor("Let's order a pizza") == "LXt's XrdXr X pXzzX"
puts vowel_censor("Nitwit, blubber, oddment, tweak") == "NXtwXt, blXbbXr, XddmXnt, twXXk"
puts vowel_censor("Supercalifragilisticexpialidocious") == "SXpXrcXlXfrXgXlXstXcXxpXXlXdXcXXXs"

# ----------------- Switch Roles!

def array_print_10
  [0,1,2,3,4,5,6,7,8,9].each{|number| puts number}
end
# Test your method by calling it! Type "array_print_10" below:
# YOUR TEST HERE
array_print_10
# Write a method, #range_print_10, that prints the numbers 0 - 9 using a range
# and the each method. Remember to test your method by calling it.

def range_print_10
  (0..9).each {|number| puts number}
end
range_print_10
# Write a method, #integer_print_10, that prints the numbers 0 - 9 using an integer
# and the times method. Remember to test your method by calling it.

def integer_print_10
  10.times do |int|
    puts int
  end
end

integer_print_10

# ----------------- Read the solutions!
