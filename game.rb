class Game

  def initialize(player, dealer)
    @deck = Deck.new
    @player = player
    @dealer = dealer
  end

  def pick(whose)
    card = @deck.pick
    
    case whose
    when :player
      @player.pick(card)
    when :dealer
      @dealer.pick(card)
    end
  end

  def limit_player?
    @player.hand_total == 3
  end

  def limit_dealer_card?
    @dealer.hand_total == 3
  end

  def limit_dealer_score?
    @dealer.score > 16
  end

  def limit?
    limit_player? && (limit_dealer_card? || limit_dealer_score?)
  end

  def pass
    pick(:dealer) unless limit_dealer_score?
  end

  def begin_game
    pick(:player)
    pick(:player)
    @player.decrement_bank
    pick(:dealer)
    pick(:dealer)
    @dealer.decrement_bank
  end

  def draw
    @player.increment_bank
    @dealer.increment_bank
  end

  def player_win
    @player.increment_bank
    @player.increment_bank
  end

  def dealer_win
    @dealer.increment_bank
    @dealer.increment_bank
  end
  
  def win
    score_dealer = @dealer.score
    score_player = @player.score
    
    if (score_dealer > 21) && (score_player > 21)
      draw
      return :much
    end

    if score_dealer > 21
      player_win
      return :much_dealer
    end
    
    if score_player > 21
      dealer_win
      return :much_player
    end

    if score_dealer == score_player
      draw
      return :draw
    end

    if score_dealer > score_player
      dealer_win
      return :dealer_win
    else
      player_win
      return :player_win
    end
  end
end