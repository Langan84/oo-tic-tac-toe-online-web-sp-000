class TicTacToe

  attr_accessor :board

  def initialize(board = nil)
     @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}  "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}  "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}   "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token

  end


  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      false
    else
      true
    end
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    count = 0
    @board.each do |i|
    count +=1 if i == "X" || i == "O"
    end
    count
  end

  def current_player
    turn_count % 2 == 0? "X" : "O"
  end

  def turn
      puts "Please enter 1-9:"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn #if invalid ask for new move
      end
    end

    def won?
       WIN_COMBINATIONS.detect do |combo|
         @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
       end
     end

     def full?
       @board.all? {|token| token == "X" || token == "O"}
     end

     def draw?
      full? && !won?
     end

     def over?
       full? && won? || draw?
     end

     def winner
      if won?
         @board[won?.first]
      end

      def play

        until over?
          turn
         if won?
           puts "Congratulations!"

         else draw?
           puts "Cats game!"
         end
      end
    end

end
