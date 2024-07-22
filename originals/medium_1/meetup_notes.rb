# meetup_notes.rb

# Understanding:
# - A typical schedule for a meetup recurrs on the same day of
#   the week for a month
#   + There are always 7 teen days
#   + A day may otherwise occur 4 or 5 times in a month
#     > The teenth may fall on the 2nd or 3rd week for a given
#       month
#     > The last week may be the 4th or 5th week.
# Task
#   + Find the date (year, month, date) that corresponds to a
#     given input
#     > Find the integer day of the month for a weekday of a
#       given week.
# Input
#   - Constructor
#     + month, integer
#     + year, integer
#   - `Meetup#day`
#     + Weekday, symbol
#     + Week reference for scheduling, symbol
#     + Returns a date object
# Output
#   - Date object
#     + year
#     + month
#     + day

# Approach:
#   - #find_date_of_weekday
#     > Iterate with two counters
#     > One counter for days of the week
#     > 2nd counter for days of the month
#     > Start weekdsy counter over when > than 7
#     > Stop when Day of the month in target week
#       + Target weeks represented as ranges
#       + Exception for target week when last
#         = Determine based on fourth week
#         = If adding 7 to the date for the fourth week is less
#           than total days in the month, that's the date.
#         = Else, just return the date for the fourth week.
