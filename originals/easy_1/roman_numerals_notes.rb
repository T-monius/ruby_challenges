# roman_numerals_notes.rb

# Understanding:
#   - Roman numerals: 
#     > 1 = I
#     > 5 = V
#     > 10 = X
#     > 100 = C
#     > 1000 = M
#   - Convert Integer to Roman numeral
#   - No 0
#   - Left most modern digit converted
#     > Subsequent numbers converted and added
#     > Rarely need to convert numbers greater then 3000
# Input
#   - Integer
#     > Apparently, the `to_roman` method is called directly
#       on the `Integer` class
# Output
#   - Roman numeral string

# Approach
#   - Create a `RomanNumerals` module and use `Object#extend`
#     to test. Can add the module by hopping into Integer
#     + Such a bad idea
#   - Set empty return string
#     > Modulus off 1000s assigning remainder and number
#       + Push 'M' * remainder to roman_numerals string
#     > Modulus off 500s if number < 900 reassigning variables
#       + Push 'D' if remainder > 0
#     > Modulus off 100s reassigning variables
#       + Push 'CM' if remainder > 9
#       + Push 'C' * remainder elsewise
#     > Mosulus off 50s if number < 90 reassigning variables
#       + Push 'L' if remainder > 0
#     > Modulus off 10s reassigning variables
#       + Push 'XC' if ramainder == 9
#       + Push 'X' * remainder elsewise
#     > Mosulus off 5s if number < 9 reassigning variables
#       + Push 'V' if remainder > 0
#     > Modulus off 1s reassigning variables
#       + Push 'IX' if ramainder == 9
#       + Push 'I' * remainder elsewise
#     > The conversion:
#       + 1-3, x * digit
#       + 4, symbol for number place prepended to symbol of
#         5 for given number place
#       + 5, symbol of 5 to the power of number place
#       + 6-8, 5 symbol plus remainder of 5 division and number
#         multiplied by 3
#       + 9, symbol for number place prepended to symbol for
#         the 10 to the given power of number place
#       + 10, symbol for 10 for the given power
#     > Push the conversion for each number place to the return
#       array upon each iteration
#   - Join the characters of the Return array
