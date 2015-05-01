require('rspec')
require('player')

describe(Player) do
  describe('#name') do
    it('give the player a name') do
      player1 = Player.new('Dan')
      expect(player1.name()).to(eq('Dan'))
    end
  end
  describe('#hand') do
    it('returns the hand of a player, should be empty at first') do
      player1 = Player.new('Dan')
      expect(player1.hand()).to(eq([]))
    end
  end
  describe('#draw_card') do
    it('pops a card from the deck, and adds it to the players hand') do
      player1 = Player.new('Dan')
      player1.draw_card()
      expect(player1.hand().empty?).to(eq(false))
    end
  end

  describe('#remove_card') do
    it("removes all cards of a particular value from a player's hands") do
    player1 = Player.new('Dan')
    player1.set_cards(1)
    player1.set_cards(2)
    player1.set_cards(1)
    player1.remove_card(1)
    expect(player1.hand()).to(eq([2]))
    end
  end

  describe('#have_any') do
    it('gives all matching cards from one player to another') do
      player1 = Player.new('Dan')
      player2 = Player.new('James')
      player1.set_cards(1)
      player2.set_cards(1)
      player1.have_any(1, player2)
      expect(player1.hand()).to(eq([1, 1]))
    end
  end

  describe('#check_four') do
    it('checks if a player has four of any type of cards, and returns those cards in an array') do
      player1 = Player.new('Dan')
      player1.set_cards(3)
      player1.set_cards(1)
      player1.set_cards(3)
      player1.set_cards(3)
      player1.set_cards(3)
      expect(player1.check_four()).to(eq([3]))
    end
  end
  # describe('.shuffle') do
  #   describe('it shuffles the deck')
  #   Player.shuffle()
  #
  #
end
