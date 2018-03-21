# Even Splitters
#
# Return an array of characters on which we can split an input string to produce substrings of the same length. Don't count empty strings after the split.
#
# Here's an example for "banana":
#
# "banana".split("a") # => ["b", "n", "n"] (all elements same length)
# "banana".split("b") # => ["", anana"] (all elements same length - there's only one element "anana" because the empty string doesn't count)
# "banana".split("n") # => ["ba", "a", "a"] (all elements NOT same length)
#
# result: ["b", "a"]

def even_splitters(string)
  #
  # your code goes here
  #
  characters = string.split('').uniq # remove duplicates
  answer = Array.new # collection of characters that split properly

  characters.each do |char| # try each character
    split_array = string.split(char).sort # split strings
    no_empty_split_array = split_array.reject {|str| str.empty?} # remove empty string

    # checks against all strings to the first and if they are the same length
    # then that character splits evenly
    if no_empty_split_array.all? {|len| len.length == no_empty_split_array[0].length}
      answer.push(char)
    end
  end
  answer
end

puts "-----Even Splitters----"
puts even_splitters("") == []
puts even_splitters("t") == ["t"]
puts even_splitters("jk") == %w[j k]
puts even_splitters("xoxo") == %w[x o]
puts even_splitters("banana") == %w[b a]
puts even_splitters("mishmash") == %w[m h]