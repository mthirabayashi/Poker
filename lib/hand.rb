require_relative 'deck'
require 'byebug'

#constant for hand ranks, weakest to strongest

#constant for valid card combinations
CARD_VALUES = {
  "A" => 14,
  "2" => 2,
  "3" =>3,
  "4" =>4,
  "5" =>5,
  "6" =>6,
  "7" =>7,
  "8" => 8,
  "9" => 9,
  "10" => 10,
  "J" => 11,
  "Q" => 12,
  "K" => 13
}

class Hand

  attr_accessor :hand, :values, :value_counts, :suits

  def initialize
    @hand = []
  end

  def add_card(card)
    @hand << card
  end

  def discard_card(index)
    @hand.delete_at(index)
  end


  def compare(hand2)
  rank_1 = HAND_RANKS.find_index(self.hand)
  rank_2 = HAND_RANKS.find_index(hand2.hand)
  winner = rank1 <=> rank_2
    if winner == -1
      rank_2
    elsif winner == 1
      rank_1
    else
      return nil
    end
  end

  def high_card
    return [0,values.first]
  end

  def pair
    return [1,pairs.first] if pairs.length == 1
    nil
  end

  def two_pair
    return [2,pairs.first] if pairs.length == 2
    nil
  end

  def three_of_a_kind
    value_counts.each do |value,count|
        return [3,value] if count==3
    end
      nil
  end

  def straight
    (0..3).each do |index|
      # byebug
      return false if values[index] != values[index+1]+1
    end
    return [4,values.first]
  end

  def flush
    return [5,values.first] if suits.all? { |suit| suit==suits[0]}
    nil
  end

  def full_house
    three=nil
    two=nil
    value_counts.each do |value,count|
      three = value if count==3
      two = value if count==2
    end
    if three && two
      return [6,three]
    else
      nil
    end

  end

  def four_of_a_kind
    value_counts.each do |value,count|
        return [7,value] if count==4
    end
      nil
  end

  def straight_flush
    return [8,values.first] if !flush.nil? && !straight.nil?
    nil
  end

  def royal_flush
    return [9,values.first] if !flush.nil? && values == [14,13,12,11,10]
  end


  def values
    vals = []
    @hand.each do |card|
      vals << CARD_VALUES[card.symbol]
    end
    vals.sort.reverse
  end

  def suits
    hand_suits = []
    @hand.each do |card|
      hand_suits << card.suit
    end
    hand_suits
  end

  def value_counts
    counts = Hash.new(0)
    values.each do |value|
      counts[value]+=1
    end
    counts
  end

  def pairs #returns array of pairs. can contain multiple pairs
    pairs = value_counts.select{|value,count| count == 2}.keys.to_a.sort.reverse
  end

end
