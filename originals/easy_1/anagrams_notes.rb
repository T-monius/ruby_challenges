# anagrams_notes.rb

# Understanding:
#   - An anagram is a rearrangement of the letters in another
#     word.
#   - 
# Input
#   - The test suite instantiates an `Anagram` object
#     + Instantiated w/ a single word
#     + Has a `match` instance method that takes an array
# Task
#   - Select words in collection argument that are anagrams
# Output
#   - `match` returns an array
#     + Anagrams of `Anagram` object found in the list
#     + Case insensitive
#     + Does not match if other word is the original word.

# Approach
#   - `match` method
#     + Select from word list
#       > Words that are anagrams of subject
#       > When comapred with subject an exact match of the
#         subject is returned.
