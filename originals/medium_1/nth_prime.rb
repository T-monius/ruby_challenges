# nth_prime.rb

class Prime
  VALID_LAST_DIGITS = [1, 3, 7, 9]
  def self.nth(int)
    raise ArgumentError if int.zero?
    prime_counter = 0
    iterator = 2
    loop do
      prime_counter += 1 if valid_prime?(iterator)
      break if prime_counter == int
      iterator += 1
    end
    iterator
  end

  def self.valid_prime?(int)
    return false if int != 2 && int != 5 && invalid_last_digit?(int)
    return false if int.even? && int != 2
    factors = find_factors(int)
    return true if factors == [1, int]
    false
  end

  def self.find_factors(int)
    factors = []
    1.upto(Integer.sqrt(int)) do |num|
      factors << num if (int % num).zero?
    end
    factors
  end

  def self.invalid_last_digit?(int)
    !VALID_LAST_DIGITS.include?(int.digits[0])
  end
end
