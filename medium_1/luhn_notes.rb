# luhn_notes.rb

# Understanding:
#   - Checksum
#     + Totals all of the digits of a number to compare
#     + Reduce model
#   - Double every second number
#     + Transformation
#     + Doubling excedes 10
#     + Minus 9
#   - Total digits of new number
#     + `checkscum` instance method
#   - New number validation
#     + `valid?` instance method
#     + Total
#     + Total % 10 == 0 ?
#   - Invalid by 1
#     + `Luhn#create` class method
#     + Add 1
#     + Return original number and new number
#       > According to the test suite, it just returns the new
#         number
#     + Append a new digit to the original starting with zero
#       + Continue with different numbers until a valid luhn
#         number is derived

# Approach
#   - Store input number as an array of digits
#   - `checksum`
#     + Work with number as array of digits
#     + Map digits (calls helper)
#       > Double or double -9
#   - `Luhn#create`
#     + Convert input number to an array of digits
#     + Add zero to the array
#       > If the number resulting is valid return it
#       > Else increment the zero until a valid number is
#         returned.
