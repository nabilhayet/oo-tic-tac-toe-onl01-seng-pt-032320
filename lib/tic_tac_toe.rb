class TicTacToe 
  attr_accessor :board 
  WIN_COMBINATIONS= [
    [0,1,2], # Top row
    [3,4,5], # middle row
    [6,7,8], # last row 
    [0,3,6], # left column
    [1,4,7], # middle column
    [2,5,8], # right column
    [0,4,8], # diagonal left to right
    [2,4,6]  # diagonal right to left 
    ]
    def initialize
    @board = Array.new(9," ")
    end
    
    def display_board 
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} " 
    end
    
    def input_to_index(input)
      input.to_i-1
      
    end 
    
    def move(index,token="X")
      @board[index] = token
    end
    
    def position_taken?(index)
      !(@board[index]==" ") ? true : false 
    end
    
    def valid_move?(index)
      (index.between?(0,8) && !position_taken?(index)) ? true : false
    end
    
    def turn 
      user_move=gets
      index=input_to_index(user_move)
      if valid_move?(index) 
        move(index,current_player)
        display_board
      else 
        puts "ask for input again"
        turn 
      end 
    end 
    
    def turn_count 
      @board.count {|x| x!=" "} 
    end 
    
    def current_player
      count=turn_count
      count.even? ? "X" : "O"
    end 
    
    def won?
     WIN_COMBINATIONS.each do |combo|
      position_1 = @board[combo[0]]
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combo
      end
    end
        return false
  end
  
  def full?
    @board.all?{|x| x=="X"|| x=="O"}
  end 
  
  def draw? 
    if (full? && (won? ==false))
      true 
    else 
      false 
    end 
  end 
  
  def over?
    if draw? || won?
      true 
    else 
      false 
    end 
  end 
    
  def winner 
    token=won?
    if token!=false 
      @board[token[0]]
    else 
      nil 
  end
  end 
  
  def play 
    until over?
    turn
    end 
    if winner
      puts "congratulate #{winner}"
    else 
      puts "Cat's game "
    end 
end 