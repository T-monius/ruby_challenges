# roman_numerals.rb

module RomanNumerals
  def to_roman
    roman_numerals = ''
    remainder, number = self.divmod(1000)
    roman_numerals << 'M' * remainder
    number = handle_hundreds(roman_numerals, number)
    number = handle_tens(roman_numerals, number)
    number = handle_ones(roman_numerals, number)
    roman_numerals
  end
end

private

def handle_hundreds(roman_numerals, number)
  if number < 900
    remainder, number = number.divmod(500)
    roman_numerals << 'D' if remainder > 0
  end
  remainder, number = number.divmod(100)
  case remainder
  when 9
    roman_numerals << 'CM'
  when 4
    roman_numerals << 'CD'
  else
    roman_numerals << 'C' * remainder
  end
  number
end

def handle_tens(roman_numerals, number)
  if number < 90
    remainder, number = number.divmod(50)
    roman_numerals << 'L' if remainder > 0
  end
  remainder, number = number.divmod(10)
  case remainder
  when 9
    roman_numerals << 'XC'
  when 4
    roman_numerals << 'XL'
  else
    roman_numerals << 'X' * remainder
  end
  number
end

def handle_ones(roman_numerals, number)
  if number < 9
    remainder, number = number.divmod(5)
    roman_numerals << 'V' if remainder > 0
  end
  case number
  when 9
    roman_numerals << 'IX'
  when 4
    roman_numerals << 'IV'
  else
    roman_numerals << 'I' * number
  end
  number
end

class Integer
  include RomanNumerals
end
