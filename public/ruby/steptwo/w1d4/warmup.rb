def longest_segment(input, delimeter)
  input_arr = input.split(delimeter)
  lengths = Hash.new(0)
  input_arr.each do |substring|
    lengths[substring] = substring.length
  end
  lengths.sort_by {|key, value| value}[-1][0]
end

puts "---------Longest Segment----------"
puts longest_segment('this is a string','a') == "this is "
puts longest_segment('this is a string','i') == "s a str"
puts longest_segment('this is a string',' ') == "string"

# ----------------- Switch Roles!

def string_sum(string)
  acc = 0
  string.split('').each do |letter|
    acc += (letter.ord - 96)
  end
  acc
end

puts "---------String Sum----------"
puts string_sum("pizza") == 78
puts string_sum("bagel") == 27
puts string_sum("smoothie") == 104

# ----------------- Read the solutions!