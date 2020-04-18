# sum_of_multiples.rb

# This class takes a set of numbers to which a given number
# will be compared as to wheter it is a multiple. An iterative
# instance method tests all of the numbers in a range up to a
# limit to see if the number in the range are multiples of the
# set; the multiples are summed.
class SumOfMultiples
  attr_reader :number_set
  def initialize(*number_set)
    number_set.empty? ? @number_set = [3, 5] : @number_set = number_set
  end

  def multiple_of_set?(num)
    number_set.any? { |set_number| (num % set_number).zero? }
  end

  def to(limit)
    multiples = (0...limit).select do |num|
      multiple_of_set?(num)
    end
    multiples.sum
  end

  def self.to(limit)
    new(3,5).to(limit)
  end
end
