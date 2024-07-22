# perfect_number_notes.rb

# Understanding:
#   - Classify numbers
#   - Based on finding all the factors of a number
#     + sum all of the numbers
#     + Exclusive of the number itself
#     + Aliquot sum
#   - 3 number classifications
#     + Abundant
#       > Aliquot sum greater than number
#     + Perfect
#       > Aliquot sum equals number
#     + Deficient
#       > Aliquot sum less than the number
#   - Input (Class method: `PefectNumber::classify')
#     + Positive integer
#   - Output
#     + String classification

# Approach
#   - Raose `RuntimeErroe` if input less than 1
#   - Iterate from 1...input
#     + Push factors to an array
#     + Sum the array
#     + Return Aliquot number
#   - Compare the Aliquot number for deficient, perfect, abundant
