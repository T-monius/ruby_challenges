# sieve.rb

# This class builds an assosiative array where the first element
# of inner arrays is a number, and the second an empty string
# or a mark. The associative array is called numbers and based
# on a limit which is passed in when an object of the class is
# instantiated. The numbers list starts at 2 and goes up to
# the limit inclusive. The numbers are then marked if they are
# composite or left as unmarked in the list if they are not.
# The unmarked numbers are stored in an array called primes.
class Sieve
  attr_reader :limit, :numbers, :primes

  def initialize(limit)
    @limit = limit
    @numbers = []
    2.upto(limit) { |num| @numbers << [num, ''] }
    mark_composites
    @primes = find_primes
  end

  def mark_composites
    current_prime = 2
    while current_prime
      mark_multiples(current_prime)
      next_prime = find_next_prime(current_prime)
      current_prime = next_prime
    end
  end

  def mark_multiples(prime)
    multiplier = 2
    multiple = prime * multiplier
    until multiple > limit
      numbers.assoc(multiple).pop
      numbers.assoc(multiple).push('X')
      multiplier += 1
      multiple = prime * multiplier
    end
  end

  def find_next_prime(current_prime)
    next_prime = numbers.find do |num, mark|
      num > current_prime && mark == ''
    end
    return false if !next_prime
    next_prime.first
  end

  def find_primes
    prime_list = numbers.select { |_, mark| mark == '' }
    prime_list.map(&:first)
  end
end

p Sieve.new(10).primes
