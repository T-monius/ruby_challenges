# secret_handshake_notes.rb

# Understanding:
#   - Exercise based on Binary (base 2)
#   - Perform sequences according to input
# Input
#   - Decimal number
#   - Convert to binary
#     + Perform action according to values in 0, 2, 4, 8,16
#       places or in a sequence of 1-5
#     + 0 place (ex. 1) => 'wink'
#     + 2 place (binary 10) => 'double blink'
#     + 4 place (binary 100) => 'close your eyes'
#     + 8 place (binary 1000) => 'jump'
#     + 16 place (binary 10000) => reverse
# Task
#   - Process the input integer
#     + Determine how many operations to perform
#       > Higher power operation get priority
#       > Ex. 12 is 1100, and represents 'jump' and 'close your
#         eyes'
#         = 'Jump' takes precedence
#         = 'jump' comes first in the order of array
#     + Divide number according to powers represented
#     + It is a matter of groups of sequences and not executing
#       a series of the same operation one by one until all
#       of the types are executed
#     + Perform 
# Output
#   - Array of operations
#     + String elements in sequence

# Approach:
#   - Convert decimal to binary string
#   - Create hash lookup for powers; values are operations
#   - Set base 2 power variable to 0
#   - Set idx to 0
#   - Set handshake operations array to empty
#   - Reverse string and iterate over it
#     + For indexes 0 to 3
#       > If there is a 1 present, push an operation to the
#         array
#     + For index 4
#       > If there is a 1 present, reverse the array
#       > Reset the index variable to 0
