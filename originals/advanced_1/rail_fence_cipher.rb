# rail_fence_ciper.rb

class RailFenceCipher
  def initialize; end

  def self.encode(inputString, rows)
    fence = Array.new(rows, '.' * inputString.length)
    y_increment = true
    y = 0
    inputString.each_char.with_index do |char, x|
      puts fence
      puts fence[y][x]
      fence[x][y] = char
      y_increment ? y += 1 : y -= 1
      y_increment = !y_increment if y % rows == 0
    end
    p fence
  end

  # def self.encode(inputString, rows)
  #   fence = Array.new(rows, '.' * inputString.length)
  #   y_increment = true
  #   y = 0
  #   inputString.length.times do |x|
  #     puts fence[y][x]
  #     fence[y][x] = inputString[x]
  #     y_increment ? y += 1 : y -= 1
  #     y_increment = !y_increment if y % rows == 0
  #   end
  #   p fence
  # end
end

# Input string is 9 characters
RailFenceCipher.encode('EXERCISES', 4)                # 'ESXIEECSR'
puts '-------------------------------------------------------------------'
# Input string is 18 characters
RailFenceCipher.encode('XOXOXOXOXOXOXOXOXO', 2)       # 'XXXXXXXXXOOOOOOOOO'