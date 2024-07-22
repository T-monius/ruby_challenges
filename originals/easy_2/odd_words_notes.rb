# odd_words_notes.rb

# Understanding:
# Input
#   - String
#     + Words
#       > Max 20 letters
#     + Single space separating words
#     + Terminated by a point
#   - Task
#     + Read each character of the string from first index to
#       last
#     + Last character is a '.'
#     + Push words to a new string
#     + Copy odd words in reverse
# Output
#   - String of same length with words at odd indexes reveresed

# Inquire
#   - What do you do if a word is greater than 20 characters?
#     > Raise an error?
#     > Don't push the word?

# Approach
#   - Set an empty return string
#   - Set empty word string variable
#   - Set flag to false
#   - Iterate over input string
#     + Push characters to word if alphabetical
#     + if char ' ' or "."
#       > Push word and char to string if flag is false
#       > Else push reversed word and char to string if true
#     + flip flag
