# scrabble_score_notes.rb

# Understanding:
# Input
#   - Word
#     + String may include non-alpha characters, but calculates
#       only alphas
#   - nil and whitespace count as 0
#   - Each letter has a value
# Task
#   - Transform letters into values and sum them
# Output
#   - Sum

# Approach
# - Defince `Scrabble` class
#   + Data-structure:
#   + Array
#     = Remove non-alphas from string
# - Lookup table
# - Map string into values
# - Sum values
# - (Alternatively) Reduce string by values

# Approach1
# - `Scrabble` class
#   + Datastructure = String
# - Lookup table is Regex w/ value
# - Iterate the hash
#   + SCan for letters that respond to the key
#   + Sum them by the current value
