# Cats in hats

# You have 100 cats.

# Your rules are simple: whenever you visit a cat, you toggle it's hat status (if it already has a hat, you remove it..
# if it does not have a hat, you put one on). All of the cats start hat-less. You cycle through 100 rounds of visiting
# cats. In the 1st round, you visit every cat. In the second round, you visit every other cat. In the nth round,
# you visit every nth cat.. until the 100th round, in which you only visit the 100th cat.

# At the end of 100 rounds, which cats have hats?

def cats_in_hats
=begin
  # your code here
  cats = Array.new(100, 'without')
  cats_with_hats = []

  round = 1
  while (round < (cats.length + 1)) # going through round 1 to 100

    i = 1
    while (i < (cats.length + 1)) # through each round, parse specified cats
      if (i % round == 0)
        if (cats[i - 1] == 'with') # cat has hat, remove it
          cats[i - 1] = 'without'
        elsif (cats[i - 1] == 'without') # cat doesn't have hat, give it one
          cats[i - 1] = 'with'
        end
      end
      i += 1
    end
    round += 1
  end

  cats.each_with_index {|cat, i| cats_with_hats.push(i + 1) if cat == 'with'} # throw the position of cats with hats
  return cats_with_hats
=end

  # more elegant approach
  cats = Array.new(100, 'without')
  cats_with_hats = Array.new

  round = 1
  while round < cats.length + 1
    cats.each_with_index do |cat, i|
      if ((i + 1) % round) == 0
        if cat == 'without'
          cats[i] = 'with'
        else
          cats[i] = 'without'
        end
      end
    end
    round += 1
  end

  cats.select.with_index {|cat, i| cats_with_hats.push(i + 1) if cat == 'with'} # fixing offset

  cats_with_hats

end

puts "------Cats in Hats------"
puts cats_in_hats == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]