class Player
  @@deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
  define_method(:initialize) do |name|
    @name = name
    @hand = []
  end

  define_method(:name) do
    @name
  end

  define_method(:draw_card) do
    @hand.push(@@deck.shuffle.pop())
  end

  define_method(:hand) do
    @hand
  end

  define_method(:set_cards) do |amount|
    @hand = @hand.push(amount)
  end

  define_method(:remove_card) do |value|
    iterate = self.hand().length()-1
    while iterate >= 0
      if self.hand[iterate] == value
        self.hand().delete_at(iterate)
      end
    iterate -= 1
    end
  end

  define_method(:have_any) do |card_self, opponent|
    iterate = opponent.hand().length()-1
    cards_to_rem = []
    while iterate >= 0
        if card_self == opponent.hand()[iterate]
        @hand.push(opponent.hand()[iterate])
        cards_to_rem.push(opponent.hand()[iterate])
        end
      iterate -= 1
    end
    cards_to_rem.each do |value|
      opponent.remove_card(value)
    end
  end

  define_method(:check_four) do
    four_cards = []
    card_value = 1
    card_amount = 0
    while card_value <= 13
      self.hand().each do |value|
        card_amount += 1 if card_value == value
      end
      four_cards.push(card_value) if card_amount == 4
      card_amount = 0
      card_value += 1
    end
    four_cards.each do |num|
      self.remove_card(num)
    end
    return four_cards
  end




end
