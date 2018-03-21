# Write a function `bubble_sort(arr)` which will sort an array of
# integers using the "bubble sort"
# methodology. (http://en.wikipedia.org/wiki/Bubble_sort)

def bubble_sort(arr)
  sorted = false
  while !sorted
    swap_did_occur = true
    # goes through one pass
    i = 0
    j = i + 1
    while i < arr.length - 1
      if arr[i] > arr[j]
        temp = arr[i]
        arr[i] = arr[j]
        arr[j] = temp
        swap_did_occur = false
      end
      i += 1
      j += 1
    end
    # check if sorted
    if swap_did_occur
      sorted = swap_did_occur
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
