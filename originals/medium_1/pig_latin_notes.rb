# pig_latin_notes.rb

# Understanding:
#   - Adapt words in English
#     + Words beginning with a vowel sound append 'ay'
#     + Words beginning with a consanant sound drop the 
#       beginning consonant, append it, then append 'ay'
#     + 'x' followed by a vowel is a consonant sound
#     + 'x' follwed by a consonant is a vowel sound
#   - Input
#     + Class method 'PigLatin::translate'
#     + Takes a string of a single word or multiple
#   - Task
#     + Operate on each individual word of the input
#       > Transform
#     + Put the transformed words back together
#   - Output
#     + A string translation of input

# Approach
#   - Split the input
#   - Iterate over array
#     > There are three types of Actions
#       + Just append 'ay'
#       + First letter a vowel or 'x', or 'y' followed by a
#         consonant
#         = Append 'ay'
#       + 1 letter swap
#       + First letter 'y' or 'z' and second letter vowel and
#         all normal consonant words
#           > Drop first letter
#           > Append to end
#           > Append 'ay'
#       + 2 letter swap
#       + First two 'ch', 'qu', 'th'
#         = Drop First two letters
#         = Append to end
#         = Append 'ay'
#       + 3 letter swap
#       + First 3 'thr' or 'sch' or Consonant followd by 'qu'
#         = Drop first three letters
#         = Append to end
#         = Append 'ay'
#     > Test word as to whether these swaps should be performed
#       + The test method will test if theres a match for any
#         of the sequences from position 0 

#   - Helper methods for transforming the words.
