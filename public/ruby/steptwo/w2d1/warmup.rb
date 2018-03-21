# Skittle Combos
#
# You have a bag of skittles. You want to know what every unique  two-flavor combination tastes like.
# Write a method that takes in a bag of skittles and returns an array of every unique two-flavor combination
# that you could make from the bag, each in its own array.
# Each of the two-flavor arrays should be arranged alphabetically.


# ------- Switch roles after 15 minutes! -------

def skittle_combos(skittles)
  two_flavor_array = Array.new
  skittles.each do |el1|
    skittles.each do |el2|
      if el1 != el2
        two_flavor_array.push([el1, el2].sort)
      end
    end
  end
  two_flavor_array.uniq.sort
end

puts "---------Skittle Combos----------"
puts (
         skittle_combos(%w[red orange green]).include?(%w[orange red]) &&
         skittle_combos(%w[red orange green]).include?(%w[green red]) &&
         skittle_combos(%w[red orange green]).include?(%w[green orange]))
puts (
         skittle_combos(%w[purple red yellow green red]).include?(%w[purple red]) &&
         skittle_combos(%w[purple red yellow green red]).include?(%w[purple yellow]) &&
         skittle_combos(%w[purple red yellow green red]).include?(%w[green purple]) &&
         skittle_combos(%w[purple red yellow green red]).include?(%w[red yellow]) &&
         skittle_combos(%w[purple red yellow green red]).include?(%w[green red]) &&
         skittle_combos(%w[purple red yellow green red]).include?(%w[green yellow]))
puts skittle_combos(%w[yellow yellow]) == []


# ----------------- Read the solutions!
