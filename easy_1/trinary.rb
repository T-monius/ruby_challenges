# trinary.rb

# This class stores a trinary representation  of a number as a
# string. Also, a method for converting the trinary to decimal
# is provided.
class Trinary
  attr_accessor :trinary

  def initialize(trinary)
    self.trinary = trinary
  end

  def to_decimal
    return 0 unless trinary.chars.all?(/[0-2]/)
    decimal = 0
    trinary_digits = trinary.chars.map(&:to_i)
    trinary_digits.reverse.each_with_index do |digit, idx|
      decimal += digit * (3**idx)
    end
    decimal
  end
end
