# Remove Nth Letter
# Define a method that accepts two arguments, a string and an integer.
# The method should return a copy of the string with the nth letter removed.

def remove_nth_letter(string, n)
  removed_letter_array = []
  string.split('').each_index do |idx|
    if (idx + 1) == n
      next
    else
      removed_letter_array.push(string[idx])
    end
  end
  removed_letter_array.join('')
end

puts remove_nth_letter('san francisco', 6) == 'san fancisco'
puts remove_nth_letter('alvin', 5) == 'alvi'
