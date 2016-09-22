require 'rspec'
require 'card'

describe Card do
  let(:card) {Card.new("2",:Spades)}

  describe '#initialize' do
    it 'holds symbol' do
      expect(card.symbol).to eq("2")
    end

    it 'holds a suit' do
      expect(card.suit).to eq(:Spades)
    end

    end
  end

end
