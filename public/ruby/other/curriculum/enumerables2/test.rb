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


el_tigre = "Tyger! Tyger! burning bright In the forest of the night What immortal hand or eye Could frame thy fearful symmetry?"
el_ciervo = "Stately, plump Buck Mulligan came from the stairhead, bearing a bowl of lather on which a mirror and a razor lay crossed."

top_hits_1 = ["Call Me Maybe", "Protect Ya Neck", "Call Me Maybe", "Protect Ya Neck", "Protect Ya Neck"]
one_week_wonders_1 = ["Call Me Maybe"]

top_hits_2 = ["Beat It", "Beat It", "Careless Whisper", "Beat It", "Baby", "Baby", "Never Gonna Give You Up", "Uptown Funk", "Uptown Funk", "Uptown Funk"]
one_week_wonders_2 = ["Careless Whisper", "Never Gonna Give You Up"]

puts "\narray_sum:\n" + "*" * 15 + "\n"
test_array_sum([1,2,3], 6)
test_array_sum([0,0,0], 0)
puts "\nin_all_strings?:\n" + "*" * 15 + "\n"
test_in_all_strings?(["leopold", "leopard", "leonine"], "leo", true)
test_in_all_strings?(["leopold", "leopard", "leonine"], "leop", false)
puts "\nnon_unique_letters:\n" + "*" * 15 + "\n"
test_non_unique_letters("abcdbcd", ["b", "c", "d"])
test_non_unique_letters("abcde", [])
puts "\nlongest_two_words:\n" + "*" * 15 + "\n"
test_longest_two_words(el_ciervo, ["Mulligan", "stairhead"])
test_longest_two_words("yarg barg yaarga barga", ["barga", "yaarga"])
puts "\nmissing_letters:\n" + "*" * 15 + "\n"
test_missing_letters(el_tigre, ["j", "k", "p", "q", "v", "x", "z"])
test_missing_letters(("A".."Z").to_a.join, [])
puts "\nno_repeat_years:\n" + "*" * 15 + "\n"
test_no_repeat_years(1990, 2000, [])
test_no_repeat_years(2016, 2020,[2016, 2017, 2018, 2019])
puts "\none_week_wonders:\n" + "*" * 15 + "\n"
test_one_week_wonders(top_hits_1, one_week_wonders_1)
test_one_week_wonders(top_hits_2, one_week_wonders_2)
puts "\nfor_cs_sake:\n" + "*" * 15 + "\n"
test_for_cs_sake("r is among the most menacing of sounds. That's why they call it murder and not muckduck.",  "muckduck")
test_for_cs_sake("muckduck cluck duck.", "muckduck")
puts "\nrepeated_number_ranges:\n" + "*" * 15 + "\n"
test_repeated_number_ranges([1, 1, 2], [[0, 1]])
test_repeated_number_ranges([8, 7, 7, 14, 12, 12, 12, 12, 21], [[1, 2], [4, 7]])
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0