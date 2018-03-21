# Write a function `bubble_sort(arr)` which will sort an array of
# integers using the "bubble sort"
# methodology. (http://en.wikipedia.org/wiki/Bubble_sort)
#
# Difficulty: 3/5

def bubble_sort(arr)
  sorted = false
  while !sorted
    was_not_sorted = true
    idx = 0
    while idx < arr.length - 1
      if arr[idx] > arr[idx + 1]
        temp = arr[idx]
        arr[idx] = arr[idx + 1]
        arr[idx + 1] = temp
        was_not_sorted = false
      end
      idx += 1
    end
    if was_not_sorted
      sorted = true
    end
  end
  arr
end

puts("\nTests for #bubble_sort")
puts("===============================================")
    puts "bubble_sort([]) == []: "  + (bubble_sort([]) == []).to_s
    puts "bubble_sort([1]) == [1]: "  + (bubble_sort([1]) == [1]).to_s
    puts "bubble_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]: "  + (bubble_sort([5, 4, 3, 2, 1]) == [1, 2, 3, 4, 5]).to_s
puts("===============================================")
