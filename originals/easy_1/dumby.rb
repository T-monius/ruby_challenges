# dumby.rb

# Understanding:
#   - See if a number is a multiple of any number in the set
#   - Set is an array
#   - Iterate over the array
#     > return true if number % set_numbber == 0

set = [3,5]

number = 9

flag = false
set.each { |set_numbber| flag = true if number % set_numbber == 0 }

puts flag
