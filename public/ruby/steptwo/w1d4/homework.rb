# Define a method, #hipsterfy, that accepts a sentence (string) as an argument.
# The method should return a new string with the last vowel removed from each word.
# 'y' is not a vowel. If a word has no vowels, don't change it. You may assume all
# letters are lower-case.## hipsterfy("towel flicker banana") => "towl flickr banan"

def hipsterfy(sentence)
  # collection of vowels
  vowels = %w[
    a e i o u
  ]
  new_sentence = Array.new

  # digest per word
  sentence.split(' ').each do |word|

    last_vowel_position = 0
    # digest per character and saving the position of the vowel
    word.split('').each_with_index do |letter, idx|
      if vowels.include?(letter)
        last_vowel_position = idx
      end
    end

    # push the newly sliced word but with extra attention if it specifies the
    # 0th index
    if last_vowel_position != 0
      new_sentence.push(word.slice(0, last_vowel_position) + word.slice(last_vowel_position + 1, word.length))
    else
      # if the 0th index is a vowel, slice it out, otherwise leave it
      if vowels.include?(word[0])
        new_sentence.push(word.slice(0, last_vowel_position) + word.slice(last_vowel_position + 1, word.length))
      else
        new_sentence.push(word)
      end
    end
  end
  new_sentence.join(' ')
end


puts "-------Hipsterfy-------"
puts hipsterfy("proper") == "propr"
puts hipsterfy("mstrkrft") == "mstrkrft"
puts hipsterfy("towel flicker banana") == "towl flickr banan"
puts hipsterfy("turtle cheeseburger fries") == "turtl cheeseburgr fris"