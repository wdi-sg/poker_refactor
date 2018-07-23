class Hand
  def initialize(cards)
    @cards = cards
  end

  def values
    card_values = []

    @cards.each do |mycard|
      value = mycard[0]
      if value == "A"
        card_values << 1
      elsif value == "T"
        card_values << 10
      elsif value == "J"
        card_values.push(11)
      elsif value =="Q"
        card_values << 12
      elsif value == "K"
        card_values.push(13)
      else
        card_values.push(value.to_i)
      end
    end

    card_values
  end

  def suits
    card_suits = Array.new

      for card in @cards do
        card_suits << card.split("")[1]
      end

    card_suits
  end

  def straight?
    ordered_values = values.sort
    is_straight = true

    ordered_values.each_with_index do |value, index| 
      if index > 0
        if value != (ordered_values[index - 1] + 1)
          is_straight = false
        end
      end
    end

    is_straight
  end

  def flush?
    is_flush = true
    
    suits.each_with_index do |suit, index| 
      if index > 0
        if suit != (suits[index - 1])
          is_flush = false
        end
      end
    end

    is_flush
  end

  def full_house?
    ordered_values = values.sort

    if values.count(ordered_values[0]) == 2
      if values.count(ordered_values[-1]) == 3
        true
      end
    elsif values.count(ordered_values[-1]) == 2
      if values.count(ordered_values[0]) == 3
        true
      end
    else
      false
    end
  end

  def four_of_a_kind?
    ordered_values = values.sort

    if ordered_values.count(ordered_values[0]) == 4
      true
    elsif ordered_values.count(ordered_values[-1]) == 4
      true
    else
      false
    end

  end

  def best_hand
    ordered_values = values.sort

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



