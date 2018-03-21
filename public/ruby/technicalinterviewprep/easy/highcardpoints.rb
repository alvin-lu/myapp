# High Card Points
#
# In the card game bridge, four cards are given point values:
# Jack: 1, Queen: 2, King: 3, Ace: 4.
# Given an array of strings corresponding to a hand of cards
# (the cards are represented like so:
# ["2","3","4","5","6","7","8","9","10","J","Q","K","A"]),
# return the total number of high card points for that hand.
#
# high_card_points(["2","3","4","5","6","7","8","9","10","J","Q","K","A"]) => 10
# high_card_points(["2", "A", "A"]) => 8

def high_card_points(hand)
  card_hash = {
    "J" => "1", "Q" => "2", "K" => "3", "A" => "4"
  }
  result = 0
  hand.each do |card_value|
    if card_hash.key?(card_value.upcase)
      result += card_hash[card_value].to_i
    end
  end
  result
end

puts high_card_points(["2","3","4","5","6","7","8","9","10","J","Q","K","A"]) == 10
puts high_card_points(["2", "A", "A"]) == 8
