# perfect_number.rb

class PerfectNumber
  def self.classify(num)
    raise RuntimeError if num < 1
    return 'abundant' if aliquot(num) > num
    return 'deficient' if aliquot(num) < num
    'perfect'
  end

  def self.aliquot(num)
    factors = (1...num).each_with_object([]) do |other_num, factors|
      factors << other_num if (num % other_num).zero?
    end
    factors.sum
  end
end
