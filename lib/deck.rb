require_relative 'card'

class Deck

  def self.generate_deck
    suits = [:Spades, :Hearts, :Diamonds, :Clubs]
    symbols = [
      "A" ,
      "2" ,
      "3" ,
      "4" ,
      "5" ,
      "6" ,
      "7" ,
      "8" ,
      "9" ,
      "10" ,
      "J" ,
      "Q" ,
      "K"
    ]
    deck = []
    suits.each do |suit|
      symbols.each do |sym|
        deck << Card.new(sym, suit)
      end
    end
    Deck.new(deck)
  end

  attr_accessor :deck

  def initialize (deck)
    @deck = deck
    my_shuffle!
  end

  def my_shuffle!
    @deck.shuffle!
  end

  def deal
    raise "empty deck" if empty?
    @deck.shift
  end

  def empty?
    @deck.empty?
  end

end
