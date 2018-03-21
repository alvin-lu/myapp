# Vowel Filter
#
# Given a string, remove every vowel if its index is odd.
# Hint: Rather than deleting characters (which would shift which characters
# are even and odd each time), construct a new string without the unwelcome
# vowels.

def disemvowel(str)
  vowels = %w[a e i o u A E I O U]
  odd_vowel_array = Array.new
  str.split("").each_index do |idx|
    if vowels.include?(str[idx]) && idx % 2 != 0
      next
    else
      odd_vowel_array.push(str[idx])
    end
  end
  odd_vowel_array.join("")
end
puts disemvowel("alvinlu") == "alvnlu"
puts disemvowel("san francisco") == "sn francsco"
