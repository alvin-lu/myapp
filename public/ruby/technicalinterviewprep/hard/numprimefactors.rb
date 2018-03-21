# Num Prime Factors
#
# Write a method that, when given a number,
# returns the number of factors of that number (including the number itself)
# that are prime.
# You may wish to write two helper methods: prime?(n) and factors(n).

def factors(n)
  factors_array = []
  i = 1
  while i <= n
    factors_array.push(i) if n % i == 0
    i += 1
  end
  factors_array
end

def prime?(n)
  idx = 2
  while idx < n
    return false if n % idx == 0
    idx += 1
  end
  true
end

def num_prime_factors(n)
  prime_factors = []
  factors(n).each do |factor|
    prime_factors.push(factor) if prime?(factor)
  end
  prime_factors
end

# puts "===Testing Factors Method==="
# puts factors(10) == [1, 2, 5, 10]
# puts factors(4) == [1, 2, 4]
# puts factors(100) == [1,2,4,5,10,20,25,50,100]
# puts "===Testing Prime? Method==="
# puts prime?(10) == false
# puts prime?(1) == true
# puts prime?(17) == true
puts '===Testing Num_Prime_Factors==='
puts num_prime_factors(10) == [1, 2, 5]
puts num_prime_factors(100) == [1, 2, 5]
puts num_prime_factors(1001) == [1, 7, 11, 13]
