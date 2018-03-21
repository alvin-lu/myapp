def hk_phone_number?(number)
  valid_numbers = %w[0 1 2 3 4 5 6 7 8 9]
  number_array = number.split(" ")
  if number_array.length != 2
    return false
  else
    # check if each index is four in size
    if number_array[0].length == 4 && number_array[1].length == 4
      #check if they are all ints, if not return false
      number_array.each do |numbers|
        numbers.split("").each do |number|
          if !valid_numbers.include?(number)
            return false
          end
        end
      end
    else
      return false
    end
  end
  true
end

puts hk_phone_number?("9131 2010") == true
puts hk_phone_number?("82930120") == false
puts hk_phone_number?("1234 1234 1234") == false
