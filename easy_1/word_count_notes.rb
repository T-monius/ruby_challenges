word_count_notes.rb

# Understanding:
# Input
#   - String
#     > Words
# Task
#   - Count the words in the string and store in a hash with
#     count
# TestSuite
#   - Ignore punctuation
#   - Cramped lists: no space but a comma separator
#   - Expanded lists: comma separated, new-line separated
#   - Normalize case
#   - Apostrophes and periods
#   - Quotations
#   - ^ Can be handled by Regex
#     > All but apostrophes can be handled by searching groups
#       of word characters
#     > Can remove any quotations on the end of words
#     > Keep quotations inside of words
# Output
#   - Hash
#     > key == word (string)
#     > value == integer

# Approach
# - Parse string against regex
# - Iterate over matches
#   > Add the matches to a hash
#     + Hash must be initialized to a default of 0
#     + Allows adding a new word
#     + Old word naturally incremented
#   > Return hash
