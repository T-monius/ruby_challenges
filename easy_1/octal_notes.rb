# octal_notes.rb

# Understanding:
# - Octal math is base 8
#   + We generally use base 10 math which
#     > Numbers from the right to left are pawers of 10 greater
#       than the number to the immediate right
#     > Rightmost number is int * 10**0 (10 to the 0 is 1)
#     > The n*th number is int * 10**n-1 
#       = The fourth number from the right would be int *
#         10**3
#   + Base 8 math would replace the 10 with an 8
#   + Class object takes a string representation of a number
#     upon instantiation
#   + A to_decimal method converts the base 8 string to base
#     10
#     > Return an integer representation of the base 8 string
#       in base 10

# Approach:
# - Create an accessor for the digit string
# - Set the digit string to the input in constructor
# - Conversion method
#   + Create a memo
#   + Set an index to 0
#   + Iterate over the string characters (chars)
#     > Convert char to_i
#     > Multiply by 8**idx
#     > Add to memo
#   + Return memo
