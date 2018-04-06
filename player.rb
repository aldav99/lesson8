class Player
  
  def initialize(name, bank = 100)
    @name = name
    @bank = bank
  end

  attr_accessor :bank
  
  def increment_bank
    self.bank += 10
  end
  
  def decrement_bank
    self.bank -= 10
  end
end