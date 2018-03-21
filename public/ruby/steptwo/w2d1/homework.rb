def number_counting_seq(n)
  result_hash = {}
  result_hash[0] = ''
  result_hash[1] = '1'
  i = 2
  while i < n + 1
    previous_sequence = result_hash[i - 1].split('')
    temp_string = ''
    count = 0
    previous_sequence.each_index do |idx|
      if idx == previous_sequence.length - 1
        count += 1
        temp_string += count.to_s + previous_sequence[idx]
      elsif previous_sequence[idx] == previous_sequence[idx + 1]
        count += 1
      else
        count += 1
        temp_string += count.to_s + previous_sequence[idx]
        count = 0
      end
    end
    result_hash[i] = temp_string
    i += 1
  end
  result_hash[n]
end

puts '-------Number Counting Sequence-------'
puts number_counting_seq(0) == ''
puts number_counting_seq(1) == '1'
puts number_counting_seq(2) == '11' # one 1 above
puts number_counting_seq(3) == '21' # two 1s above
puts number_counting_seq(5) == '111221' # the last sequence was one 1, one 2, and two 1s: "1211"
puts number_counting_seq(8) == '1113213211'
puts number_counting_seq(10) == '13211311123113112211'
