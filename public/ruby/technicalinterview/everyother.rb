def everyother(array)
  result_array = array

  odd = true
  while result_array.length != 1
    if odd
      odd = false
      result_array = reduce_array_odd(result_array)
    else
      odd = true
      result_array = reduce_array_even(result_array)
    end
  end
  result_array
end

def reduce_array_even(array)
  result_array = Array.new
  array.each_with_index do |element, idx|
    if ((idx + 1) % 2 != 0)
      result_array.push(element)
    end
  end
  result_array
end

def reduce_array_odd(array)
  result_array = Array.new
  array.each_with_index do |element, idx|
    if ((idx + 1) % 2 == 0)
      result_array.push(element)
    end
  end
  result_array
end

# ex
# [1,2,3,4,5,6,7]
# [2,4,6] deletes all odd index
# [2,6] deletes all even index
# [6] deletes all odd index

p everyother([1,2,3,4,5,6]) == [6]
p everyother([1,2,3,4,5,6,7,8,9,10,11,12]) == [6]
p everyother([2,4,6,8,12]) == [4]
