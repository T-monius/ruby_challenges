# grade_school_notes.rb

# Understanding:
#   - The descripion and the test suite don't mirror each other according
#     to the logic that I'd use
#     + Does not test that the `add` can respond to a sentence prompt
#       > `add` can store the inputs in an unnordered list/array and 
#         pass all of the tests
#       > Could presumably have a `Grade` object for each but not
#         necessary
#     + Nor the `which`
#       > This concept is represented in the `grade` instance method
#       > Returns an array (sorted?) of all of the students in a grade
#     + `to_h` returns a hash which associates students w/ grade
#     + `sort`
#       > Returns a sorted hash.
#       > The value array (list of names ought to be sorted, ascending)

# Approach:
#   - Roster instance variable
#     + Unsorted nested array
#     + Student (string), grade (int)
#   - `add` instance method
#     + Push inputs to roster in array
#   - `grade` 
#     + Select by second arg
#     + return sorted array
#   - `to_h`
#     + Iterate over the roster
#     + Build a hash with default empty array value
#     + Keys grade integers
#     + Values, arrays of names
#     + Sort the keys
#     + Sort the hash
