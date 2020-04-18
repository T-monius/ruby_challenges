# queen_attack.rb

class Queens
  attr_reader :white, :black

  def initialize(white: [0, 3], black: [7, 3])
    raise ArgumentError if white == black
    self.white = white
    self.black = black
    self.board = generate_board
  end

  def attack?
    can_attack_diagonally? ||
      # Can attack on the same row
      black[0] == white[0] ||
      # Can attack on the same column
      black[1] == white[1]
  end

  def to_s
    board
  end

  protected

  attr_accessor :board
  attr_writer :white, :black

  def generate_board
    board = ''
    8.times do |x|
      8.times do |y|
        board << 'W' if white_position?(x, y)
        board << 'B' if black_position?(x, y)
        board << '_' if !white_position?(x, y) &&
                        !black_position?(x, y)
        board << ' '
      end
      board << "\n"
    end
    board.gsub(/ \n/, "\n").chomp
  end

  def white_position?(x, y)
    white[0] == x && white[1] == y
  end

  def black_position?(x, y)
    black[0] == x && black[1] == y
  end

  def can_attack_diagonally?
    (black[0] - white[0]).abs == (black[1] - white[1]).abs
  end
end
