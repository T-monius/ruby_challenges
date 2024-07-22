# series_notes.rb

# Understanding:
# - A series is a consecutive sequence of digits
# - In order to identify a series of a give length n in a number
#   the length n must be less than or equal to the given number's
#   digit length.
# - The number in the program will be represented by a string
#   + This is a fundamental point because some of the strings
#     have a leading zero which would not work for an integer
#     representation of the number
# - Input
#   + The object capturing the input is a `Series` object
#     > Passed to constructor method
#     > String argument
#     > Represents digits
#   + `slices` instance method
#     > Length n
#     > Passed to the instance method as an argument
# - Output
#   + Substrings of n length
#     > Represented in arrays
#     > `slices` returns a multi-dimensional array with two
#       layers
#     > Inner arrays are all length n
#     > Elements of inner arrays are integers
#     > Inner arrays are individual digits of consecutive series
#   + `slice` throws an argument error if the argument n is
#     greater than the length of the series string.

# Approach:
#   - Define a class `Series`
#     + Instance variable that stores number string
#     + Constructor method
#       > Takes a single string argument
#       > Verify?
#       > Set a variable to the digits of the series identifier
#       > Set string argument to the number string instance
#         variable
#     + `slices` instance method
#       > Takes a single integer argument
#         = Throw error if argument > than series iidentifies
#           length
#       > Set an empty return array
#       > Iterate over the digits array
#         = Break if slice of n digits out of bounds
#         = Push sequence of digits from index of iteration for
#           length n to return array
#         = Increment index
