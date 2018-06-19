require './player.rb'
require './turn_manager.rb'

class Game

  def initialize
    puts "What's the name of the player 1?"
    print "> "
    player1 = Player.new(gets.chomp)
    puts
    puts "What's the name of the player 2?"
    print "> "
    player2 = Player.new(gets.chomp)

    @player = [player1, player2]
    @turn_manager = TurnManager.new(@player)
  end

  def play
    while not game_over?
      current_player = @turn_manager.current_player

      puts "It is #{current_player.name}'s turn"
      puts

      current_player.play(current_player)

      if current_player.current_points > 0
        print_summary
        puts "\n----- NEW TURN -----"
      else
        puts "\n#{@last_player_name} wins with a score of #{@last_player_points}/#{@last_player_mpoints}"
        puts "----- GAME OVER -----"
        puts "Good bye!"
      end

      @last_player_name = current_player.name
      @last_player_points = current_player.current_points
      @last_player_mpoints = current_player.max_points

      swap_players
      sleep 0.2

    end
  end

  def game_over?
    @player.any? { |r| r.dead? }
  end

  def swap_players
    @turn_manager.next
  end

  def print_summary
    puts "#{@player[0].summary} vs #{@player[1].summary}"
  end
end