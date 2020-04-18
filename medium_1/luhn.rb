# luhn.rb

# Members of this class have instance variables that store a
# digit and integer representation of an input number. There
# are mechanisms available to validate whether it is valid
# according to the Luhn alogorithm as well as create a valid
# Luhn number.
class Luhn
  attr_accessor :id_num, :id_digits

  def initialize(id_num)
    self.id_num = id_num
    self.id_digits = id_num.digits
  end

  def addends
    addends = id_digits.map.with_index do |digit, idx|
      if idx.odd?
        digit * 2 > 9 ? digit * 2 - 9 : digit * 2
      else
        digit
      end
    end
    addends.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(id)
    new_digits = id.digits.unshift(0)
    new_id = Luhn.reverse_digits_to_int(new_digits)
    new_luhn = Luhn.new(new_id)
    new_luhn.valid? ? new_luhn.id_num : new_luhn.increment_till_valid
  end

  def self.reverse_digits_to_int(digs)
    digs.reverse.map(&:to_s).join.to_i
  end

  def increment_till_valid
    id_digits[0] += 1 until valid?
    self.id_num = Luhn.reverse_digits_to_int(id_digits)
  end
end
