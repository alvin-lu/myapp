def muni_routes(routes, destination)
  if !routes.values.include?(destination)
    nil
  else
    routes.each do |key, value|
      if value == destination
        return key
      end
    end
  end
end

puts "---------Muni Routes----------"
puts muni_routes({3 => "Arizmendi", 27 => "Nopalito", 55 => "Brenda's Soul Food"}, "Brenda's Soul Food") == 55
puts muni_routes({7 => "Devil's Teeth", 33 => "Devil's Teeth"}, "Devil's Teeth") == 7
puts muni_routes({90 => "Padrecito", 43 => "Hard Knox", 67 => "Martha's"}, "Hard Knox") == 43
puts muni_routes({10 => "Good Luck Dim Sum", 25 => "Art's Cafe"}, "Japanese Tea Hut") == nil

# ----------------- Switch Roles!

def largest_factor(n)
  array = []
  i = 1
  while i < n
    if n % i == 0
      array << i
    end
    i += 1
  end
  array[-1]
end

puts "---------Largest Factor----------"
puts largest_factor(10) == 5
puts largest_factor(143) == 13
puts largest_factor(27) == 9
puts largest_factor(17) == 1

# ----------------- Read the solutions!