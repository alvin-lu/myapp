# Hashtagify

# Given a sentence string and an array of words, hashtag-ify the words (case-insensitive)
# in the original string and return the updated cool string with hashtags.

def hashtagify(sentence, tags)
  result_array = Array.new
  sentence.split(" ").each do |word|
    if sentence.include?("!") || sentence.include?(".")
      result_array.push(punctuation_in_word(word, tags))
    else
      if tags.include?(word.downcase)
        result_array.push("#" + word)
      else
        result_array.push(word)
      end
    end
  end
  result_array.join(" ")
end

def punctuation_in_word(word, tags)
  alpha = %w[ a b c d e f g h i j k l m
              n o p q r s t u v w x y z
              A B C D E F G H I J K L M
              N O P Q R S T U V W X Y Z ]
  numeric = %w[ 0 1 2 3 4 5 6 7 8 9 ]
  result = ""
  temp_string = ""
  punctuation = ""
  word.split("").each do |chr|
    if alpha.include?(chr)
      temp_string += chr
    else
      punctuation = chr
    end
  end
  if tags.include?(temp_string.downcase)
    return "#" + temp_string + punctuation
  else
    return temp_string + punctuation
  end
end

puts "-------Hashtagify-------"
puts hashtagify("fun!", ["fun"]) == "#fun!"
puts hashtagify("coding", ["coding"]) == "#coding"
puts hashtagify("coding is fun", ["coding", "fun"]) == "#coding is #fun"
puts hashtagify("Coding is fun!", ["coding", "fun"]) == "#Coding is #fun!"
puts hashtagify("Learned about coding.", ["coding"]) == "Learned about #coding."
