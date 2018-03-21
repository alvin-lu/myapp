$success_count = 0
$failure_count = 0

def deep_dup(arr)
  arr.inject([]) { |acc, el| el.is_a?(Array) ? acc << deep_dup(el) : acc << el }
end

def note_success(returned, invocation, expectation)
  puts "success: #{invocation} => #{expectation}"
  $success_count += 1
end

def note_failure(returned, invocation, expectation)
  puts "failure: #{invocation}: expected #{expectation}, returned #{returned}"
  $failure_count += 1
end

def format_args(args)
  o_args = deep_dup(args)
  o_args.map! do |arg|
    arg = prettify(arg)
    arg.class == Array ? arg.to_s : arg
  end
  o_args.join(', ')
end

def prettify(statement)
  case statement
    when Float
      statement.round(5)
    when String
      "\"#{statement}\""
    when NilClass
      "nil"
    else
      statement
  end
end

def equality_test(returned, invocation, expectation)
  if returned == expectation && returned.class == expectation.class
    note_success(returned, invocation, expectation)
  else
    note_failure(returned, invocation, expectation)
  end
end

def identity_test(returned, invocation, expectation, args)
  if returned.__id__ == args[0].__id__
    equality_test(returned, invocation, expectation)
  else
    puts "failure: #{invocation}: You did not mutate the original array!"
    $failure_count += 1
  end
end

def method_missing(method_name, *args)
  method_name = method_name.to_s
  expectation = args[-1]
  args = args[0...-1]
  if method_name.start_with?("test_")
    tested_method = method_name[5..-1]
    print_test(tested_method, args, expectation)
  else
    method_name = method_name.to_sym
    super
  end
end

def print_test(method_name, args, expectation)
  returned = self.send(method_name, *args)
  returned = prettify(returned)
  expectation = prettify(expectation)
  args_statement = format_args(args)
  invocation = "#{method_name}(#{args_statement})"
  method_name.include?("!") ? identity_test(returned, invocation, expectation, args) : equality_test(returned, invocation, expectation)
rescue Exception => e
  puts "failure: #{invocation} threw #{e}"
  puts e.backtrace.select {|t| !t.include?("method_missing") && !t.include?("print_test")}
  $failure_count += 1
end

landmarks_1 = ["House", "Horse"]
pairs_1 = [["House", "Horse"], ["Horse", "House"]]
landmarks_2 = ["Tree", "Mountain", "Ocean", "Cottage"]
pairs_2 = [["Tree", "Mountain"], ["Mountain", "Ocean"], ["Ocean", "Cottage"], ["Cottage", "Tree"]]

puts "\wanagrams?:\n" + "*" * 15 + "\n"
test_anagrams?("desert", "rested", true)
test_anagrams?("banana", "fofanna", false)
puts "\wisogram_matcher:\n" + "*" * 15 + "\n"
test_isogram_matcher("or", "go", [0,1])
test_isogram_matcher("unpredictably", "hydromagnetic", [1,8])
puts "\wpanoramic_pairs:\n" + "*" * 15 + "\n"
test_panoramic_pairs(landmarks_1, pairs_1)
test_panoramic_pairs(landmarks_2, pairs_2)
puts "\wxbonacci:\n" + "*" * 15 + "\n"
test_xbonacci([1, 1], 5, [1, 1, 2, 3, 5])
test_xbonacci([1, 1, 1, 1], 8, [1, 1, 1, 1, 4, 7, 13, 25])
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0