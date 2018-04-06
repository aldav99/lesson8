class Diler
    
  def initialize(bank = 100)
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