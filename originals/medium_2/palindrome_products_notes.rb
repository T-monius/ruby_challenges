# palindrome_products_notes.rb

# Understanding:
# - A palindrome is the same backwards and forwards
# - A palindrome product is a palindrome derived from multiplying
#   two numbers
#   + We can set the criteria for the numbers to multiply
#   + Multiply all of the numbers that meet the given criteria
#     > Find all the combinations
#     > If a given product is a palindrome, store it as a
#       palindrome, and add its factors in its value subset.
#       = Store the two multipliers as a factor
#   - `Palindrome` class
#     > Has an instance variable for it's factors
#       + Factors according to those in program criteria that
#         derive it
#       + May Include repeats 
#     > Initialized setting a palindromic integer to an instance
#       variable
#     > `#value`
#       = Return the numeric value of the palindrome
#       = Integer
#     > `#factors`
#       = Returns a nested array
#       = Inner array a pair of factors
#     > `<=>`
#       = Compare by value
# - `Palindromes` class
#   + `#initialize`
#     > Takes 'keyword arguments'
#     > Key-value pairs, hash
#     > Not required
#       = Can't write my method definition with required
#         keyword arguments
#       = Can I provide a default for a keyword argument?
#       = I can instead use a hash with my default parameters
#         and merge it with my hash arguments.
#   + `#generate`
#     > Store in an instance variable
#       = Array
#     > Call `combination` or `repeat_combination` on an array
#       representation of the range
#     > Select the combinations that produce palindromes
#     > Iterate the palindromic factors and initialize palin-
#       dromes
#   + `#largest`
#     > Returns the palindrome in range with the largest value
#   + `#

# Approach:
#   - Initialize a set of palindromes
#     + Given arguments represent range of multipliers
#     + Palindromes derived from factors in the range
#   - Get all of the combinations of factors in the range
#   - Select the factors that produce a palindrome
#     + Helper method `#palindrome?`
#   - Store palindromes from factors
#     + `@palindromes`
#     + Either a hash whose keys are the palindrome and values
#       factors
#     + Or, an array of `Palindrome` objects with an instance
#       variable of it's factors
#       > Compares by value
#     + Iterate the factors and add a new palindrome and associate
#       the factors at iteration with it.
