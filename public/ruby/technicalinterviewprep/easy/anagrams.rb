# Anagrams?
#
# Anagrams are two words with exactly the same letters. Order does not matter.
# Define a method that, given two strings, returns a boolean indicating whether
# or not they are anagrams.

def anagrams?(str1, str2)
  str1_hash = Hash.new
  str2_hash = Hash.new

  str1.split("").each do |char|
    if str1_hash.key?(char)
      str1_hash[char] += 1
    else
      str1_hash[char] = 1
    end
  end
  str2.split("").each do |char|
    if str2_hash.key?(char)
      str2_hash[char] += 1
    else
      str2_hash[char] = 1
    end
  end
  if str1_hash == str2_hash
    return true
  end
  false
end

puts anagrams?("ate", "eat") == true
puts anagrams?("alvin", "nivla") == true
puts anagrams?("south", "north") == false
