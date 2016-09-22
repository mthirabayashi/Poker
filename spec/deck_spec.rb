require 'rspec'
require 'deck'

describe Deck do
  let(:new_deck) {Deck.generate_deck}

  describe "#initialize" do
    it "creates a new deck" do
      expect(new_deck.deck.length).to eq(52)
    end

    it "should contain card objects" do
      expect(new_deck.deck[1]).to be_a(Card)
    end

    it "should have no duplicate cards" do

    end

  end

  describe "#my_shuffle" do
    # let(:initial_deck_order) {new_deck.deck}
    it "randomizes cards" do
      initial_deck_order = []
      new_deck.deck.each do |card|
        initial_deck_order << card
      end
      # initial_deck_order = new_deck.deck
      # new_deck_order = new_deck.shuffle!

      new_deck.my_shuffle!
      expect(new_deck.deck).to_not eq(initial_deck_order)
    end
  end

  describe "#deal" do
    it "removes the top card the deck" do
      new_deck.deal
      expect(new_deck.deck.length).to eq(51)
    end

    subject(:empty_deck) {Deck.generate_deck}
    it "raises error if deck is empty" do
      empty_deck.deck = []
      expect { empty_deck.deal }.to raise_error("empty deck")
    end

  end

end
