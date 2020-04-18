# clock_notes.rb

# Undserstanding:
# Time keeping
#   - Independant of date
#   - Clocks compared by time
#   - Minutes and hours
#   - `#at`
#     + Returns a new clock object
#     + Piggy backs off of the constructor
#     + Takes hour and minute arguments
#   - `to_s`
#     + Returns a string in '00:00' format
#   - `#<=>`
#     + Compare by total minutes
#   - `#-`
#     + Subtract from total minutes
#     + Integer input represents minutes
