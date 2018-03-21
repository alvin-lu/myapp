def aliquot(int, seq)
  aliquot_array = Array.new
  aliquot_array.push(int)
  temp_value = int
  idx = 1
  while idx < seq
    sum = 0
    factors(temp_value).each do |number|
      sum += number
    end
    aliquot_array.push(sum)
    temp_value = sum
    idx += 1
  end
  aliquot_array
end

def factors(int)
  factors_array = Array.new
  idx = 1
  while idx < int
    if int % idx == 0
      factors_array.push(idx)
    end
    idx += 1
  end
  factors_array
end

p aliquot(10, 4) == [10, 8, 7, 1]
p aliquot(7, 4) == [7, 1, 0, 0]
