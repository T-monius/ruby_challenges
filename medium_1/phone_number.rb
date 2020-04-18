# phone_number.rb

class PhoneNumber
  TEN_ZEROS = '0000000000'
  attr_reader :number

  def initialize(num)
    self.number = ten_digits(num)
  end

  def area_code
    number[0..2]
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[-4..-1]}"
  end

  private

  attr_writer :number

  def handle_eleven_digits(nums)
    return TEN_ZEROS if nums[0] != '1'
    nums[1..-1]
  end

  def ten_digits(num)
    return TEN_ZEROS if num.match?(/[A-Za-z]/)
    nums_only = num.scan(/[0-9]/).join
    digit_length = nums_only.length
    return TEN_ZEROS if digit_length < 10 || digit_length > 11
    nums_only = handle_eleven_digits(nums_only) if digit_length == 11
    nums_only
  end
end
