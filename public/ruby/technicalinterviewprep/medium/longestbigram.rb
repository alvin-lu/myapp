# Longest Bigram
#
# A bigram is a pair of consecutive words.
# Given a string, return the longest bigram in that string.
# Include the space between the words. Assume there will be no punctuation.
# In the case of a tie, return the earlier bigram.
# E.g., longest_bigram("One must have a mind of winter") => "must have"

def longest_bigram(sentence)
  sentence_array = Array.new
  sentence.split(" ").each_index do |idx|
    if idx != sentence.split(" ").length - 1
      sentence_array.push(sentence.split(" ")[idx] + " " + sentence.split(" ")[idx + 1])
    end
  end
  # find longest Bigram
  bigram_length = 0
  bigram_words = ""
  sentence_array.each do |bigram|
    if bigram.length > bigram_length
      bigram_length = bigram.length
      bigram_words = bigram
    end
  end
  bigram_words
end

puts longest_bigram("One must have a mind of winter") == "must have"
