# point_mutations_notes.rb

# Undertanding:
#   - A Point mutation is a difference between a sequence of
#     characters.
#   - Each difference between two strings in a sequence is a
#     mutation
#   - Compare two strings of the same length and see how many
#     differences there are.
#   - `DNA` class instantiated with a string
#   - `hamming_distance` instance method compares the strnig
#     stored as an instance variable with and argument string.
#     + Returns and integer. 

# Approach:
#   - Iterate over two strings simultaneously
#     + Compare the characters at each index
#     + Increment a counter if there two characters do not
#       match
