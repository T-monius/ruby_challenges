# minesweeper.rb
require 'pry'

class ValueError < StandardError; end

class Board
  def initialize; end

  def self.transform(board_rows)
    board = Board.new
    board.validate(board_rows)
    inner_rows = board_rows[1...-1]
    inner_rows.map!.with_index do |row, row_index|
      board.transform_row(board, board_rows, row, row_index)
    end
    [board_rows[0]] + inner_rows + [board_rows[-1]]
  end

  def transform_row(board, board_rows, row, row_index)
    new_row = []
    row.chars.each_with_index do |square, sqr_idx|
      new_row << square if square != ' '
      next unless square == ' '
      outer_index = row_index + 1
      row_above = board_rows[outer_index - 1]
      row_below = board_rows[outer_index + 1]
      new_row << board.count_adjacent_sqrs(row_above, row, row_below, sqr_idx)
    end
    new_row.join.tr('0', ' ')
  end

  def count_adjacent_sqrs(row_above, current_row, row_below, square_index)
    count = 0
    count += 1 if current_row[square_index - 1] == '*'
    count += 1 if current_row[square_index + 1] == '*'
    [row_above, row_below].each do |row|
      count = count_mines(square_index, row, count)
    end
    count.to_s
  end

  def validate(board)
    raise ValueError unless valid_length?(board)
    raise ValueError unless valid_border?(board)
    raise ValueError unless valid_characters?(board)
  end

  private

  def valid_length?(board)
    row_length = board[0].length
    return false unless board.all? { |row| row_length == row.length }
    true
  end

  def valid_characters?(board)
    return false if board.join.count('^| \-+*0-9') > 0
    true
  end

  def valid_border?(board)
    return false unless board.all? do |row|
      row.match?(/[+|]([ *0-9]*|\-*)[+|]/)
    end
    true
  end

  def count_mines(square_index, row, count)
    row.chars[square_index - 1..square_index + 1].each do |char|
      count += 1 if char == '*'
    end
    count
  end
end
