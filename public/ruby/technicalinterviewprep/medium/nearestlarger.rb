# Write a function, `nearest_larger(arr, i)` which takes an array and an
# index.  The function should return another index, `j`: this should
# satisfy:
#
# (a) `arr[i] < arr[j]`, AND
# (b) there is no `j2` closer to `i` than `j` where `arr[i] < arr[j2]`.
#
# In case of ties (see example below), choose the earliest (left-most)
# of the two indices. If no number in `arr` is larger than `arr[i]`,
# return `nil`.
#
# Difficulty: 2/5

def nearest_larger(arr, idx)
  # if idx is the first
  if idx == 0
    # if right is bigger
    if arr[idx + 1] > arr[idx]
      return idx + 1
    # else search through everything else
    else
      biggest_value = arr[idx]
      biggest_value_index = -1
      arr.each_with_index do |number, jdx|
        if number > biggest_value
          biggest_value = number
          biggest_value_index = jdx
        end
      end
      if biggest_value_index == -1
        return nil
      else
        return biggest_value_index
      end
    end
  # if index is the last
  elsif idx == arr.length - 1
    # if left is bigger
    if arr[idx - 1] > arr[idx]
      return idx - 1
    # else search through everything else
    else
      biggest_value = arr[idx]
      biggest_value_index = -1
      arr.each_with_index do |number, jdx|
        if number > biggest_value
          biggest_value = number
          biggest_value_index = jdx
        end
      end
      if biggest_value_index == -1
        return nil
      else
        return biggest_value_index
      end
    end
  # for the in between
  else
    # both left and right are bigger than itself
    if (arr[idx - 1] > arr[idx]) && (arr[idx + 1] > arr[idx])
      return idx - 1
    # either left or right are bigger than itself
    elsif (arr[idx - 1] > arr[idx]) || (arr[idx + 1] > arr[idx])
      if arr[idx - 1] >= arr[idx + 1]
        return idx - 1
      end
      return idx + 1
    # none are bigger so just trying to find the biggest, if not then nil
    else
      # parse through the array and find the biggest and return its index
      biggest_value = arr[idx]
      biggest_value_index = -1
      arr.each_with_index do |number, jdx|
        if number > biggest_value
          biggest_value = number
          biggest_value_index = jdx
        end
      end
      if biggest_value_index == -1
        return nil
      else
        return biggest_value_index
      end
    end
  end
end

puts("Tests for #nearest_larger")
puts("===============================================")
    puts "nearest_larger([2,3,4,8], 2) == 3: "  + (nearest_larger([2,3,4,8], 2) == 3).to_s
    puts "nearest_larger([2,8,4,3], 2) == 1: "  + (nearest_larger([2,8,4,3], 2) == 1).to_s
    puts "nearest_larger([2,6,4,8], 2) == 1: "  + (nearest_larger([2,6,4,8], 2) == 1).to_s
    puts "nearest_larger([2,6,4,6], 2) == 1: "  + (nearest_larger([2,6,4,6], 2) == 1).to_s
    puts "nearest_larger([8,2,4,3], 2) == 0: "  + (nearest_larger([8,2,4,3], 2) == 0).to_s
    puts "nearest_larger([2,4,3,8], 1) == 3: "  + (nearest_larger([2,4,3,8], 1) == 3).to_s
    puts "nearest_larger([2, 6, 4, 8], 3) == nil: "+ (nearest_larger([2, 6, 4, 8], 3) == nil).to_s
    puts "nearest_larger([2, 6, 9, 4, 8], 3) == 2: "+ (nearest_larger([2, 6, 9, 4, 8], 3) == 2).to_s
puts("===============================================")
