class Dialog

  def initialize
    @card = CardDeck.new
  end

  def account
    puts "В банке дилера #{@diler.bank}"
    puts "В банке игрока #{@player.bank}"
  end
  
  def draw
    @player.increment_bank
    @diler.increment_bank
  end

  def player_win
    @player.increment_bank
    @player.increment_bank
  end

  def diler_win
    @diler.increment_bank
    @diler.increment_bank
  end
  
  def win
    arr_diler = @card.pick_card_diler
    arr_player = @card.pick_card_player
    score_diler = @card.score(arr_diler)
    score_player = @card.score(arr_player)
    
    if (score_diler > 21) && (score_player > 21)
      puts "Оба набрали больше 21! Ничья"
      draw
      return
    end

    if score_diler > 21
      puts "Дилер перебрал! Игрок победил"
      player_win
      return
    end
    
    if score_player > 21
      puts "Игрок перебрал!Дилер победил"
      diler_win
      return
    end

    if score_diler == score_player
      puts "Ничья. Оба набрали по #{score_player}"
      draw
      return
    end

    if score_diler > score_player
      puts "Дилер победил"
      diler_win
    else
      puts "Игрок победил"
      player_win
    end
  end
  
  def select_action
    if limit_player? && (limit_diler_card? || limit_diler_score?)
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
      pass
    when 2
      add_card
    when 3
      open_card
    else
      puts "Внимательнее"
      select_action
    end
  end

  def limit_player?
    @card.pick_card_player.length == 3
  end

  def limit_diler_card?
    @card.pick_card_diler.length == 3
  end

  def limit_diler_score?
    arr = @card.pick_card_diler
    @card.score(arr) > 16
  end

  def pass
    arr = @card.pick_card_diler
    if limit_diler_score?
      puts "дилер передает ход"
    else
      @card.pick(:diler)
    end
    select_action
  end

  def add_card
    if !limit_player?
      @card.pick(:player)
      @card.show(:player)
      pass
    else
      puts "Вы взяли 3 карты. Ход переходит дилеру."
      pass
    end
  end

  def continue_game?
    puts "Играем дальше? Да - 1. Нет - 2"
    
    choice = gets.to_i
    
    case choice
    when 1
      @card = CardDeck.new
      puts "Создана новая колода"
      begin_game_player
      begin_game_diler
      select_action
    when 2
      puts "Спасибо за игру."
      abort
    else
      puts "Внимательнее"
      continue_game?
    end
  end

  def open_card
    puts "Итог:"
    @card.show(:player)
    puts "------------------"
    @card.show(:diler)
    win
    account
    continue_game?
  end

  def begin_game_player
    @card.pick(:player)
    @card.pick(:player)
    @card.show(:player)
    @player.decrement_bank
  end

  def begin_game_diler
    @diler.decrement_bank
    @card.pick(:diler)
    @card.pick(:diler)
    puts "Карты дилера"
    puts "[* , *]"
  end

  def output
    loop do
      puts 'Введите Ваше имя?'
      player_name = gets.chomp
      @player = Player.new(player_name)
      @diler = Diler.new
      puts "Создана игрок: #{player_name}"
      puts "#{player_name} получил две карты"
      begin_game_player
      begin_game_diler
      select_action
    end
  end
end