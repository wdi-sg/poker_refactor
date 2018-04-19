class Hand
  def initialize(cards)
    @cards = cards
  end

  def values
    values_arr = []
    @cards.each do |card|
      value = card[0]
      case value 
      when "A"
        values_arr << 1
      when "T"
        values_arr << 10
      when "J"
        values_arr << 11
      when "Q"
        values_arr << 12
      when  "K"
        values_arr << 13
      else
        values_arr << value.to_i
      end
    end
    values_arr
  end

  def suits
    suits_arr = []
    @cards.each { |card| suits_arr << card[1] } 
    return suits_arr
  end

  def straight?
    ordered_values = values.sort
    ordered_values.each_with_index do |value, index| 
      if index > 0
        if value != (ordered_values[index - 1] + 1)
          return false
        end
      end
    end
    return true
  end

  def flush?
    suits.each_with_index do |suit, index| 
      if index > 0
        if suit != (suits[index - 1])
          return false
        end
      end
    end
    return true
  end

  def full_house?
    ordered_values = values.sort
    if (values.count(ordered_values.first) == 2 && values.count(ordered_values.last) == 3) || (values.count(ordered_values.first) == 3 && values.count(ordered_values.last) == 3)
      return true
    end
    return false
  end

  def four_of_a_kind?
    ordered_values = values.sort
    if values.count(ordered_values.first) == 4 || values.count(ordered_values.last) == 4
      return true
    end
    return false
  end

  def best_hand
    if straight? && flush?
      "Straight Flush"
    elsif four_of_a_kind?
      "Four of a Kind"
    elsif full_house?
      "Full House"
    elsif flush?
      "Flush"
    elsif straight?
      "Straight"
    else
      "Not much"
    end
  end

end



