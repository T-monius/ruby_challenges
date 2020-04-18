# transform_8631.rb

# Understanding:
#   - 8631
# Task
#   + Operate on each digit of the number
#     > Every first number, store in array
#     > Every second number, multiple by two and store in array
#       = If multiplying by two excedes 10 then subtract 9
# Output
#   - Luhn number array

# Algorithm:
#   - Transformation
#   - Set variable to the digits of the integer
#   - Set variable to empty array
#   - Iterate over the array
#     + Right to left
#     + Operate on reversed array
#     + If element is 'first' (even index) push it the array
#     + If element is 'second' multiply it by 2 and push to
#       array if not greater then 9 otherwise sutract 9 after
#       doubling.

p digs = 8631.digits
luhn_digits = []

digs.each_with_index do |digit, idx|
  puts "#{digit} #{idx}"
  if idx.odd?
    luhn_digits << 'open to analysis'
  else
    luhn_digits << digit
  end
end

p luhn_digits.reverse
