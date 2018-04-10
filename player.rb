class Player
  
  def initialize(name = 'dealer', bank = 100)
    @name = name
    @bank = bank
    @hand = []
  end

  attr_reader :bank

  def hand
    @hand
  end

  def hand_total
    @hand.length
  end

  def clear_hand
    @hand.clear
  end

  def pick(card)
    self.hand << card
  end

  def score
    sum = 0
    @hand.each do |card| 
      sum + card.value <= 21 ? sum += card.value : sum += card.alter_value
    end
    sum
  end
  
  def increment_bank(value = 10)
    self.bank += value
  end
  
  def decrement_bank(value = 10)
    self.bank -= value
  end

  private

  attr_writer :bank
end