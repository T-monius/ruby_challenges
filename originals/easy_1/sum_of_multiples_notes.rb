# sum_of_multiples_notes.rb

# Understanding:
# Input
#   - Single integer
#   - Any number of integer multiples
#   - SumOfMultiples class
#     > Constructor method 
#       + Arguments represent particular numbers of which to
#         test for multiple
#       + Default particular numbers are 3 and 5
#       + Arbitrary number of arguments to be taken
#       + Will have to test against this arbitrary number
#     > `to` method
#       + Takes a single argument
#       + Number to which multiples are sought (up from 0?)
# Output
#   - Single integer

# Approach:
# Declare a class SumOfMultiples
#   - Data Structures
#     > Instance variable to store the particular numbers
#       Array?
#     > 
#   - Algorithm
#     > `to` instance method
#     > Performing Selection then Iteration with the intent to
#       sum/reduce
#     > set empty array
#     > Iterate from 0 upto the argument value
#     > Push to array if the number is a multiple of any number
#       in the set
#       + How do I test whether a number is a multiple of any
#         number in a set?
#     > Sum array
