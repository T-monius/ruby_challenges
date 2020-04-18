# nth_prime_notes.rb

# Understanding:
# - A prime number is divisible by only the integer 1 and itself
#   > Is it safe to say that a non-prime will be divisible by
#     some number between 2 and 10?
# - Input
#   + An integer
#     > Represents the nth prime the sequence of primes from
#       2 to n
# - Output
#   + Integer
#   + Represents the prime number at n position in the
#     sequence

# Approach
#   - Set prime counter to 0
#   - Set iteration counter to 2
#   - Iterate while counter is less than n
#     + If number is prime
#       > increment prime
#       > increment iteration counter
#   - Return iteration counter

#   Iterate from 2
#     + Increment prime count if number is a prime
#     + Stop when the prime count is n

#     + `#valid_prime?`
#       return false if not 2 or 5 and does not end in
#       1, 3, 7, or 9
#       > `::find_factors` of iteration number
#         = Returns and array
#       > return true if factors array is only 1 and itself
#       > false

#   + `::find_factors`
#     + Set factors array
#     + Set counter 
#     + Iterate from 1 upto number / 2
#     + Push number to factors array if number % counter is 0
#     # return factors array