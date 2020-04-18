# sieve_notes.rb

# Understanding:
# - Sieve of Erasthones is an ancient algorithm
#   + Method of finding primes from 2 up to a limit
#   + Iterative
#   + Methodology
#     > Mark all of the multiples of a given prime to limit as
#       non-prime (composite)
#     > What does it mean to 'mark' a number?
#       = Keep it in a 'composite' list
#       = Keep a list of primes
#   + The test suite
#     > Expects only a list of the primes returned in
#       an array called primes
#     > I could make this pass as long as I find the primes
#     > However, it may work more appropriate to the Sieve of
#       of Erathosthenes if I use a single associative array
#       or hash v. two arrays.
#   + The argument at initialization represents the limit
#   + Principal advantage of this algorithm is not having to
#     iterate over every number between two and the limit.
#     - Consider marking numbers in an associative array
#     - Next number at iteration is the first found w/o a mark
#       in my data structure.
#     - Another approach which would be quite beneficial would
#       be to have a collaborator class for 'sieve numbers'
#       which are initiialized unmarked
#       + Iteration is then a matter of selecting the next
#         object from an array which is unmarked.

# Approach:
#   - Create a class Sieve
#   - Reader for sieve
#   - Reader for primes
#   - Initialization
#     + Set primes to an empty array
#     + Create an associative array from 2 up to the limit
#     + Push number and '' in an array to the sieve array
#   - Define method for marking composites
#     - Set current prime variable to 2
#     -  Iterate
#         > Mark all multiples of current prime up to the limit
#           = Sub-iteration or method.
#           = Set a variable for multiple to the number
#           = Set a variable for multiplier to 2
#           = Iterate (may use an until loop )
#             - Set multiple variable to itself times multiplier
#             - Find number in sieve which is equal to the
#               multiple and pop it's mark
#             - Find again and mark
#             - Increment multiplier by 1
#         > Find the next prime
#           = The next prime is the next unmarked number in the
#             list
#           = Select next numbers greater than p and not marked
#           = Select first of the list
#   - Primes method
#     + Select all elements without a mark
#     + Iterate over the selection and simply unshift the 
#       number into return array

# Other_Approach
#   - Instead of using two arrays, set an empty hash
#     + Mark numbers or not as I iterate
#     + Can build the hash at initialization or as I find
#       composites or iterate over the range.
