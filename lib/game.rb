require_relative 'hand'
#require_relative 'player'

class Game

  def initialize(*players)
    @players = players
    @deck = Deck.generate_deck
    @current_player = @players.first
    @pot = 0
  end

  def play
      until game_over
        play_round
      end
      p "we have a champion"
  end

  def play_round
    @players << @players.shift
    @current_player = @players.first
    deck = Deck.generate_deck
    deal_cards
    betting_round
    discard_and_add
    betting_round
    showdown
  end

  def betting_round

  end

  def game_over
    @players.length == 1
  end

  def bust(player)
    @players.delete(player)
  end

  def round_winner
    # @pot goes to winning player
  end

end
