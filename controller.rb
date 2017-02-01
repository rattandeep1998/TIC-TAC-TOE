require_relative 'board.rb'
require_relative 'player.rb'

class Game
  
  def initialize 
    @B=nil
    @P1=nil
    @P2=nil
  end
  
  def play_game
    print "Enter Dimension Of Board : "
    dimension = gets.chomp.to_i
    @B=Board.new dimension

    @B.display_board
    
    print "Enter Player1 Name : "
    playerName1 = gets.chomp
    print "Enter Player1 Symbol : "
    playerSymbol1 = gets.chomp
    print "Enter Player2 Name : "
    playerName2 = gets.chomp
    print "Enter Player2 Symbol : "
    playerSymbol2 = gets.chomp


    @P1=Player.new playerName1, playerSymbol1
    @P2=Player.new playerName2, playerSymbol2


    curPlayer=@P1

    result=false

    x=@B.check_full
    
    while @B.check_full==false
      sleep 0.5

      system("clear")
      @B.display_board
      puts "Current Player: #{curPlayer.playerName}"
      print "Enter Position(x coordinate):"
      x = gets.chomp.to_i
      print "Enter Position(y coordinate):"
      y = gets.chomp.to_i

      currentSymbol=curPlayer.playerSymbol

      # puts x,y,currentSymbol
      output=@B.make_move_on_board x, y, currentSymbol
      puts output

      if output=="MOVE SUCCESSFUL"

        result=@B.check_win
        if(result==true)
          sleep 0.5
          system("clear")
          @B.display_board
          puts
          puts "#{curPlayer.playerName} wins"
          break
        else
          if curPlayer==@P1
            curPlayer=@P2
          else
            curPlayer=@P1
          end
        end
      end
    end

    if result==false
      puts "DRAW"
    end

  end
end