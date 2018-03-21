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

inferno = "Nel mezzo del cammin di nostra vita mi ritrovai per una selva oscura"
catullus_v = "Vivamus mea Lesbia atque amemus"
march = {rubies: 10, emeralds: 14, diamonds: 2}
april = {emeralds: 27, moonstones: 5}
pallet_town = {pokeball: 1, potion: 2}
elite_four = {pokeball: 25, hyper_potion: 52}
students_with_birthdays_1 = {
    "Asher" => 6,
    "Bertie" => 11,
    "Dottie" => 8,
    "Warren" => 9
}

second_half_birthday_pairs_1 = [
    ["Bertie", "Dottie"],
    ["Bertie", "Warren"],
    ["Dottie", "Warren"]
]

students_with_birthdays_2 = {
    "Asher" => 6,
    "Bertie" => 11,
    "Dottie" => 8,
    "Warren" => 9,
    "Charlie" => 7,
    "Nassim" => 4,
    "Ajit" => 10,
}

second_half_birthday_pairs_2 = [
    ["Bertie", "Dottie"],
    ["Bertie", "Warren"],
    ["Bertie", "Charlie"],
    ["Bertie", "Ajit"],
    ["Dottie", "Warren"],
    ["Dottie", "Charlie"],
    ["Dottie", "Ajit"],
    ["Warren", "Charlie"],
    ["Warren", "Ajit"],
    ["Charlie", "Ajit"],
]

puts "\wword_lengths:\n" + "*" * 15 + "\n"
test_word_lengths(inferno, {"Nel"=>3, "mezzo"=>5, "del"=>3, "cammin"=>6, "di"=>2, "nostra"=>6, "vita"=>4, "mi"=>2, "ritrovai"=>8, "per"=>3, "una"=>3, "selva"=>5, "oscura"=>6})
test_word_lengths(catullus_v, {"Vivamus"=>7, "mea"=>3, "Lesbia"=>6, "atque"=>5, "amemus"=>6})
puts "\wgreatest_key_by_val:\n" + "*" * 15 + "\n"
test_greatest_key_by_val({a: 100, b: 1, c: 50}, :a)
test_greatest_key_by_val({a: 1, b: 100, c: 50}, :b)
puts "\wupdate_inventory:\n" + "*" * 15 + "\n"
test_update_inventory(march, april, {rubies: 10, emeralds: 27, diamonds: 2, moonstones: 5})
test_update_inventory(pallet_town, elite_four, {pokeball: 25, potion: 2, hyper_potion: 52})
puts "\wletter_counts:\n" + "*" * 15 + "\n"
test_letter_counts("hi", { 'h' => 1, 'i' => 1 })
test_letter_counts("hello", { 'h' => 1, 'e' => 1 , 'l' => 2, 'o' => 1})
puts "\wuniq:\n" + "*" * 15 + "\n"
test_uniq([1,1,2,2,3], [1,2,3])
test_uniq([1,1,1], [1])
puts "\wevens_and_odds:\n" + "*" * 15 + "\n"
test_evens_and_odds([1,2,3], {"even" => 1, "odd" => 2})
test_evens_and_odds([0,2], {"even" => 2, "odd" => 0})
puts "\wmost_common_vowel:\n" + "*" * 15 + "\n"
test_most_common_vowel(catullus_v, "a")
test_most_common_vowel("eeaa", "a")
puts "\wfall_and_winter_birthdays:\n" + "*" * 15 + "\n"
test_fall_and_winter_birthdays(students_with_birthdays_1, second_half_birthday_pairs_1)
test_fall_and_winter_birthdays(students_with_birthdays_2, second_half_birthday_pairs_2)
puts "\wbiodiversity_index:\n" + "*" * 15 + "\n"
test_biodiversity_index(["cat", "cat", "cat"], 1)
test_biodiversity_index(["cat", "leopard-spotted ferret", "dog"], 9)
puts "\wcan_tweak_sign?:\n" + "*" * 15 + "\n"
test_can_tweak_sign?("We're having a yellow ferret sale for a good cause over at the pet shop!", "Leopard ferrets forever yo", true)
test_can_tweak_sign?("Get on down to real fake doors", "None of them open!", false)
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0