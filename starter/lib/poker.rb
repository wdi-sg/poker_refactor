class Hand
  def initialize(cards)
    @cards = cards
  end

  def values
    card_values = []

    @cards.each do |mycard|
      value = mycard[0]
      obj = {
        "A" => 1,
        "T" => 10,
        "J" => 11,
        "Q" => 12,
        "K" => 13,
      }

      if obj[value]
        card_values << obj[value]
      else 
        card_values << value.to_i
      end

      # ================================
      #     EITHER THE ABOVE OR BELOW
      # ================================

      # case value
      #   when "A"
      #     card_values << 1
      #   when "T"
      #     card_values << 10
      #   when "J"
      #     card_values << 11
      #   when "Q"
      #     card_values << 12
      #   when "K"
      #     card_values << 13
      #   else
      #     card_values << value.to_i
      # end


    end

    card_values.sort
  end

  

  def suits
    card_suits = Array.new

      for card in @cards do
        card_suits << card.split("")[1]
      end

    card_suits
  end

  def straight?
    ordered_values = values
    is_straight = true

    ordered_values.each_with_index do |value, index| 
      if index > 0 && value != (ordered_values[index - 1] + 1)
        is_straight = false
      end
    end

    is_straight
  end

  def flush?
    # is_flush = true
    
    # suits.each_with_index do |suit, index| 
    #   if index > 0
    #     if suit != (suits[index - 1])
    #       is_flush = false
    #     end
    #   end
    # end

    # is_flush

    suits.uniq.length == 1
  end

  def full_house?
    ordered_values = values

    if ordered_values.count(ordered_values[0]) == 2 && ordered_values.count(ordered_values[-1]) == 3
        true
    elsif ordered_values.count(ordered_values[-1]) == 2 && ordered_values.count(ordered_values[0]) == 3
        true
    else
      false
    end
  end

  def four_of_a_kind?
    ordered_values = values

    if ordered_values.count(ordered_values[0]) == 4 || ordered_values.count(ordered_values[-1]) == 4
      true
    else
      false
    end

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



