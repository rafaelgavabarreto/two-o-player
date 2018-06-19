class Player
    attr_reader :name, :current_points, :max_points

    def initialize(name)
      @name = name
      @current_points = 3
      @max_points = 3
      @numbers = 20
    end
  
    def play()
      number1 = rand(@numbers) + 1
      number2 = rand(@numbers) + 1
      puts "#{@name}: What does #{number1} plus #{number2}?"
      print "> "
      anwser = gets.chomp.to_i

      if anwser == (number1 + number2)
        puts "#{@name}: YES! You are correct."
        return true
      else
        puts "#{@name}: Seriously? No!"
        @current_points -= 1
        return false
      end
    end
  
    def dead?
      @current_points <= 0
    end
  
    def summary
      "#{@name}: #{@current_points}/#{@max_points}"
    end
  end