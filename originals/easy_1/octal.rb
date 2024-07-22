# octal.rb

# This class stores an octal representation as a string. Also,
# a method for converting the octal to decimal is provided.
class Octal
  attr_accessor :octal

  def initialize(octal)
    self.octal = octal
  end

  def to_decimal
    return 0 unless octal.chars.all?(/[0-7]/)
    decimal = 0
    octal_digits = octal.chars.map(&:to_i)
    octal_digits.reverse.each_with_index do |digit, idx|
      decimal += digit * (8**idx)
    end
    decimal
  end
end
