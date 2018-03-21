# W2D2 Pair Programming
# A bigram is a pair of consecutive words. Given a string, return the longest bigram in that string.
# Include the space between the words. Assume there will be no punctuation.
# In the case of a tie, return the earlier bigram.

def longest_bigram(str)
	bigram_hash = Hash.new
  bigram_str = str.split(" ")
  bigram_str.each_with_index do |word, i|
    if i == bigram_str.length - 1
      next
    else
      bigram_hash[word + " " + bigram_str[i + 1]] = (word + " " + bigram_str[i + 1]).length
    end
  end
  temp_str = ""
  temp_str_length = 0
  bigram_hash.keys.each do |compound|
    if compound.length > temp_str_length
      temp_str = compound
      temp_str_length = compound.length
    end
  end
  p temp_str
end

puts longest_bigram('this house is extremely flat') == 'extremely flat'
puts longest_bigram('arizona flies flee flames') == 'arizona flies'
puts longest_bigram('harry makes paper balls') == 'harry makes'
