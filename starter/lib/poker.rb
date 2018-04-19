require 'byebug'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def get_value_of_card(card)
    letter_to_value_map = {"A" => 1, "T" => 10, "J" => 11, "Q" => 12, "K" => 13}
    letter_to_value_map[card] || card.to_i
  end

  # this function should return an array of the values of the cards, but not mutate the array itself.
  def values
    @cards.map {|card| get_value_of_card(card[0])}.sort
  end

  # this function should return an array of the suits of the cards, but not mutate the array itself.
  def suits
    @cards.map {|card| card[1]}
  end
  
  # test for a straight by checking if the values are in running order
  # store the result of values in a variable to avoid running the values method more than once
  def straight?
    tmp = values
    tmp.last - tmp.first == 4 || tmp == [1, 10, 11, 12, 13]
  end

  # Ignore royal, straight, etc. Just check for the presence of only 1 suit.
  def flush?
    suits.uniq.size == 1
  end

  def full_house?
    tmp = values
    tmp.uniq.map{|value| tmp.count(value)}.sort == [2,3]
  end

  def four_of_a_kind?
    tmp = values
    tmp.uniq.map{|value| tmp.count(value)}.sort == [1,4]
  end

  def best_hand
    highest_value = values[-1]
    (straight? && flush? && highest_value == 13) ? 'Royal Flush'
    : (straight? && flush?) ? 'Straight Flush'
    : (four_of_a_kind?) ? 'Four of a Kind'
    : (full_house?) ? 'Full House'
    : (flush?) ? 'Flush'
    : (straight?) ? 'Straight'
    : 'Meh.'
  end
end
byebug
sample = Hand.new(["As", "Ks", "Qs", "Js", "Ts"])
puts sample.best_hand
