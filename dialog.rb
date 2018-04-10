class Dialog

  def account
    puts "В банке дилера #{@dealer.bank}"
    puts "В банке игрока #{@player.bank}"
  end

  def show_hand(cards)
    cards.each { |card| puts card }
  end

  def show(whose)
    case whose
    when :player
      puts "Вы"
      show_hand(@player.hand)
      puts "Ваши очки: #{@player.score}"
    when :dealer
      puts "Дилер"
      show_hand(@dealer.hand)
      puts "Очки дилера: #{@dealer.score}"
    end
  end
  
  def add_card
    if !@game.limit_player?
      @game.pick(:player)
      @game.pass
    else
      puts "Вы взяли 3 карты. Ход переходит дилеру."
      @game.pass
    end
    select_action
  end

  def select_action
    if @game.limit?
      puts "Игроки достигли лимита на выбор. Открываемся."
      open_card
    end
    
    puts 'Ваш ход. Выберите вариант действий.'
    puts "1. Пропустить"
    puts '2. Добавть карту (только если на руках 2 карты)'
    puts '3. Открыть карты'
    
    choice = gets.to_i
    
    case choice
    when 1
      @game.pass
      select_action
    when 2
      add_card
    when 3
      open_card
    else
      puts "Внимательнее"
      select_action
    end
  end

  def start(player, dealer)
    @game = Game.new(player, dealer)
    @game.begin_game
    show(:player)
    select_action
  end

  def continue_game?
    puts "Играем дальше? Да - 1. Нет - 2"
    
    choice = gets.to_i
    
    case choice
    when 1
      puts "Создана новая колода"
      @player.clear_hand
      @dealer.clear_hand
      start(@player, @dealer)
    when 2
      puts "Спасибо за игру."
      abort
    else
      puts "Внимательнее"
      continue_game?
    end
  end

  def result
    res = @game.win
    case res
    when :much
      puts "Оба набрали больше 21! Ничья"
    when :much_dealer
      puts "Дилер перебрал! Игрок победил"
    when :much_player
      puts "Игрок перебрал!Дилер победил"
    when :draw
      puts "Ничья."
    when :dealer_win
      puts "Дилер победил"
    when :player_win
      "Игрок победил"
    end
  end

  def open_card
    puts "Итог:"
    result
    show(:player)
    puts "------------------"
    show(:dealer)
    account
    continue_game?
  end

  def output
    loop do
      puts 'Введите Ваше имя?'
      player_name = gets.chomp
      @player = Player.new(player_name)
      @dealer = Player.new
      puts "Создан игрок: #{player_name}"
      start(@player, @dealer)
    end
  end
end