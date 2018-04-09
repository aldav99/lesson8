class Deck
  
  SUITS = [:heart, :diamond, :club, :spade]
  RANKS = {ace:10, king: 10, queen: 10, jack: 10, 
           two: 2, three: 3, four: 4, five: 5, six: 6,
           seven: 7, eight: 8, nine: 9, ten: 10}
  
  def initialize
    @cards ||= []
    SUITS.each do |suit|
      RANKS.each_pair do |rank, value|
        @cards << Card.new(suit, rank, value)
      end
    end
    @cards.shuffle!
  end

  def rank
    RANKS.each_pair { |rank, value| puts "#{rank} => #{value}" }
  end

  def suit
    SUITS.each { |suit| puts "#{suit}" }
    
  end

  def cards
    @cards.each { |cards| puts "#{cards}"}
  end

  def number_cards
    @cards.length
  end

  def pick
    @cards.shift
  end
end