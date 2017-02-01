class Board

  attr_accessor :size,:board

  def initialize n
  	@size=n

  	@board = [n]

  	i=1
  	while i<=n
  	  @board[i]= [n]
  	  i=i+1
  	end

  	i=1
  	while i<=n
  	  j=1
  	  while j<=n
  	    @board[i][j]=nil
  	    j=j+1
  	  end
  	  i=i+1
  	end
  end

  def display_board
  	i=1
  	while i<=@size

      if i==1
        col=1
        while col<=@size
          print "    ",col,"\t"
          col=col+1
        end
        puts
        puts
      end


      print i,""
  	  j=1
  	  while j<=@size
        if @board[i][j] == nil
          print "\t"
        else
  	      print "   ",@board[i][j],"\t"
        end

        if j<@size
          print "|"
        end
        j=j+1
  	  end
      puts
      if i<@size
        k=1
        while k<=@size
          print "   ___\t"
          k=k+1
        end
      end
  	  puts
      puts
  	  i=i+1
  	end
  end

  def make_move_on_board i, j, ch
  	if i >0 && i<=@size && j>0 && j<=@size
  	  if @board[i][j]!=nil
        "POSITION ALREADY FILLED"
  	  else
  	  	@board[i][j]=ch
        "MOVE SUCCESSFUL"
  	  end
  	else
  	  "INVALID COORDINATES"
  	end
  end


  def check_full
    i=1
    while i<=@size
      j=1
      while j<=@size
        if @board[i][j]== nil
          return false
        end
        j=j+1
      end
      puts
      i=i+1
    end
    return true
  end

  def check_win
    i=1
    while i<=@size
      currentSymbol=@board[i][1]

      if currentSymbol !=nil
        flag=true
        j=1
        while j<=@size
          if @board[i][j] != currentSymbol
            flag=false
            break
          end

           j=j+1
        end

        if flag==true
          return flag
        end
      end
      i=i+1
    end

    i=1
    while i<=@size
      currentSymbol=@board[1][i]
      if currentSymbol != nil  
        flag=true
        j=1
        while j<=@size
          if @board[j][i] != currentSymbol
            flag=false
            break
          end

           j=j+1
        end

        if flag==true
          return flag
        end
      end
      i=i+1
    end

    i=1
    currentSymbol=@board[1][1]
    if currentSymbol != nil
      flag=true
      while i<=@size
        if @board[i][i] != currentSymbol
          flag=false
          break
        end
        i=i+1
      end
      if flag==true
        return flag    
      end
    end

    i=1
    currentSymbol=@board[1][@size]
    if currentSymbol != nil
      flag=true
      while i<=@size
        if @board[i][@size-i+1] != currentSymbol
          flag=false
          break
        end
        i=i+1
      end

      if flag==true
        return flag
      end
    end
    
    return false

  end

end