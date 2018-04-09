class Player
  
  def initialize(name = 'dealer', bank = 100)
    @name = name
    @bank = bank
  end

  attr_reader :bank

  def hand
    @hand ||= []
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
    @hand.each { |card| sum = card.add(sum) }
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