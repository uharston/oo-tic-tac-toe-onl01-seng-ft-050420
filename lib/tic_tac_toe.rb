require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3 ,6], # Left column
  [1, 4, 7], # Middle colomn
  [2, 5, 8], # Right colomn
  [0, 4, 8], # Left Diagonal
  [2, 4, 6]  # Right Diagonal
]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def input_to_index(input)
    input.to_i - 1
  end
  #adds the tokens to the board. X is always first
  def move(board_index, token)
    @board[board_index] = token
  end

  def position_taken?(index)
    #Ex. @board[3][0] => "X" - true
    #Ex. @board[2][0] => " " - false
    @board[index].include?(" ") ? false : true
  end
  #check if index is between 0 and 8? Range? 3.between?(1, 5) => true
  #check if the index is on the board => position_taken?(index)

  def valid_move?(index)  #valid_move(0) => false
    index.between?(0,8) && !position_taken?(index)
    #!(index > 8 || @board[index].include?("X" || "O")) ?  true  : false
  end
  #it determines whose turn it is based off the number of X's and O's.
  def turn_count
    #both ways work
    # @board.count("X") + @board.count("O")
    @board.count {|i| ["X", "O"].include? i}
  end

  # def turn
  #   # puts current_player
  #   input = gets.chomp #=> 3
  #   index = input_to_index(input) #=> index = 2
  #   if (valid_move?(index) == true)
  #     move(index, current_player)
  #     display_board
  #   else
  #     # puts "1"
  #     turn
  #   end
  #
  # end

def turn
  puts "Please choose a number 1-9:"
  input = gets.chomp

  index = input_to_index(input)
  if valid_move?(index)
    # player_token =
    move(index, current_player)

  else
    turn
  end
  display_board
end
  #Tell us the current play according to #turn_count
  def current_player

    turn_count % 2 == 0 ? "X" : "O"
  end
  #how do we return true if someone has a winning combination?
  #how do i check if X indexes in @board match any of the array in
  #WIN_COMBINATIONS?
  #I need to iterate through WIN_COMBINATIONS
  #i => sub array of WIN_COMBINATIONS
  def won?
    win_array = []
    WIN_COMBINATIONS.each do|sub_array|
      winner_1 = sub_array[0]
      winner_2 = sub_array[1]
      winner_3 = sub_array[2]

      won_1 = @board[winner_1]
      won_2 = @board[winner_2]
      won_3 = @board[winner_3]

      if won_1 == "X" && won_2 == "X" && won_3 == "X"
       sub_array
binding.pry
      elsif won_1 == "O" && won_2 == "O" && won_3 == "O"
         sub_array


      end

    end
false
  end

end



# rspec spec/01_tic_tac_toe_spec.rb
# rspec spec/01_tic_tac_toe_spec.rb
