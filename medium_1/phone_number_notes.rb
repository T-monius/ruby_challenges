# phone_number_notes.rb

# Understanding:
#   - PhoneNunber class
#   - Three Public Instance methods
#     + `#number`
#     + `#area_code`
#     + `#to_s`
#   - `#number`
#     + Input
#       > String
#       > (000) 000-0000, proper format
#     + Task
#       > Determine if valid
#         - Less than 10 digits, invalid
#         - 10 digits, valid
#         - 11 digits but not prefixed by 1, invalid
#         - 11 digits with first digit 1, valid
#         - More than 11 digits, invalid
#     + Output
#       > 10 character string
#       > All digits
#       > Valid numbers w/ punctuation removed
#       > All zeros for invalids

# Approach:
#   - Guard clause to for zeros if any input with alphas
#     > Use Regex to test for a match
#   - Set variable to just digits from the string
#     > Scan w/ Regex
#   - Return zeros if greater than 11
#   - Return zeros if less than 10
#   - For 11 digit numbers
#     > Return zeros if leading string not 1
#     > Set variable to last ten digits if 1
#   - Return 10 digits
