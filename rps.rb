class Player
  def initialize(name)
    @name = name
  end
end

class Human < Player
  def get_gesture
    input = gets.chomp
  end
end

class Computer < Player
  def get_gesture
  	input = ['R', 'P', 'S'].shuffle!.last
  end
end


class RPS
  @playername = ""
  @gestures = []
  @message = ""

  def intro
    puts "Welcome to Rock-paper-scissors! You will be playing with the computer."
    puts "What is your name: "
    @playername = gets.chomp
    puts "Welcome, #{@playername}! Type in \"R\" for Rock, \"P\" for Paper, and \"S\" for Scissors."
  end

  def intro2
    puts "Hi again, #{@playername}! Type in \"R\" for Rock, \"P\" for Paper, and \"S\" for Scissors."
  end

  def input_valid?
    if(@gestures[0] == "R")
      true
    elsif(@gestures[0] == "S")
      true
    elsif(@gestures[0] == "P")
      true
    else
      false
    end
  end

  def decide
     if(@gestures[0] == @gestures[1])
       @message = "It's a tie"
     elsif(@gestures[0] == "R" && @gestures[1] == "S")
       @message = "#{@playername}, you won!"
     elsif(@gestures[0] == "S" && @gestures[1] == "P")
       @message = "#{@playername}, you won!"
     elsif(@gestures[0] == "P" && @gestures[1] == "R")
       @message = "#{@playername}, you won!"
     else
       @message = "#{@playername} you lost! The computer won!"
     end
  end

  private
  def get_player_gestures
    human = Human.new(@playername)
    computer = Computer.new("computer")
    @gestures = [human.get_gesture, computer.get_gesture]
  end

  def continue?
    begin
        puts "Play again?: (Y/N)"
        continue = gets.chomp.upcase
    end while !["Y", "N"].include?(continue)
    continue
  end

  def show_message
    puts "You chose #{@gestures[0]}, while the computer chose #{@gestures[1]}. #{@message}"
  end

  def initialize()
    #first time player enters
    intro

      begin
        get_player_gestures
        input_valid = input_valid?
        if(!input_valid)
          puts "Oh no #{@playername}, that's not a valid input! Try again"
        end
      end while !input_valid

    decide
    show_message
    continue = continue?


    if(continue == "Y")
      begin
        intro2

        begin
          get_player_gestures
          input_valid = input_valid?
          if(!input_valid)
            puts "Oh no #{@playername}, that's not a valid input! Try again"
          end
        end while !input_valid

        decide
        show_message
        continue = continue?
      end while continue == "Y"
      puts "Goodbye, #{@playername}!"
    else
    puts "Goodbye, #{@playername}!"
    end
  end
end


game = RPS.new
