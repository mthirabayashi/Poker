require 'rspec'
require 'hand'
require 'byebug'

describe Hand do

  let(:new_hand) {Hand.new}
  describe "#initialize" do
    it "should start as an empty array (before you draw from the deck)" do
      expect(new_hand.hand).to be_empty
    end
  end

  describe "#add_card" do
    let(:card) {double("card")}
    before(:each) do
      new_hand.add_card(card)
    end
    it "should increase hand size by one" do
      expect(new_hand.hand.length).to eq(1)
    end


  end

  describe "#discard_card" do
    let(:card) {double("card", value: 6, suit: "Spades")}
    before(:each) do
      new_hand.hand = [card]
      new_hand.discard_card(0)
    end
    it "should decrease hand size by one" do
      expect(new_hand.hand).to be_empty
    end

  end

  describe "#straight" do
    let(:card1) {double("card", symbol: "2", suit: "Spades")}
    let(:card2) {double("card", symbol: "3", suit: "Spades")}
    let(:card3) {double("card", symbol: "4", suit: "Spades")}
    let(:card4) {double("card", symbol: "5", suit: "Spades")}
    let(:card5) {double("card", symbol: "6", suit: "Spades")}
    before(:each) do
      new_hand.add_card(card1)
      new_hand.add_card(card2)
      new_hand.add_card(card3)
      new_hand.add_card(card4)
      new_hand.add_card(card5)
    end
    it "returns straights rank and highest card" do
      # debugger
      expect(new_hand.straight).to eq([4,6])
    end
  end

  describe "#flush" do
    let(:card1) {double("card", symbol: "2", suit: "Spades")}
    let(:card2) {double("card", symbol: "3", suit: "Spades")}
    let(:card3) {double("card", symbol: "4", suit: "Spades")}
    let(:card4) {double("card", symbol: "5", suit: "Spades")}
    let(:card5) {double("card", symbol: "6", suit: "Spades")}
    before(:each) do
      new_hand.add_card(card1)
      new_hand.add_card(card2)
      new_hand.add_card(card3)
      new_hand.add_card(card4)
      new_hand.add_card(card5)
    end
    it "returns straights rank and highest card" do
      # debugger
      expect(new_hand.flush).to eq([5,6])
    end
  end

  describe "#full_house" do
    let(:card1) {double("card", symbol: "2", suit: "Spades")}
    let(:card2) {double("card", symbol: "2", suit: "Hearts")}
    let(:card3) {double("card", symbol: "2", suit: "Clubs")}
    let(:card4) {double("card", symbol: "3", suit: "Spades")}
    let(:card5) {double("card", symbol: "3", suit: "Hearts")}
    before(:each) do
      new_hand.add_card(card1)
      new_hand.add_card(card2)
      new_hand.add_card(card3)
      new_hand.add_card(card4)
      new_hand.add_card(card5)
    end
    it "returns straights rank and highest card" do
      # debugger
      expect(new_hand.full_house).to eq([6,2])
    end
  end

  describe "#straight_flush" do
    let(:card1) {double("card", symbol: "2", suit: "Spades")}
    let(:card2) {double("card", symbol: "3", suit: "Spades")}
    let(:card3) {double("card", symbol: "4", suit: "Spades")}
    let(:card4) {double("card", symbol: "5", suit: "Spades")}
    let(:card5) {double("card", symbol: "6", suit: "Spades")}
    before(:each) do
      new_hand.add_card(card1)
      new_hand.add_card(card2)
      new_hand.add_card(card3)
      new_hand.add_card(card4)
      new_hand.add_card(card5)
    end
    it "returns straights rank and highest card" do
      # debugger
      expect(new_hand.straight_flush).to eq([8,6])
    end
  end

  # describe "#compare" do
  #   before(:each) do
  #     royal_hand = "Royal Flush"
  #     high_hand = "High Card"
  #   end
  #   it "should return the better hand" do
  #     expect()
  #
  #   end
  #
  #
  # end



end
