# beer_song_notes.rb

# Understandning:
# Input
#   - Integer/integers
#   - Input for all instance methods represents the portion
#     of the song to be processed
# Task
#   - Determine which verse of the song to associate with integer
#     > Interpolate into the verse
#   - Repeat previuos step for a determined number of times
# Output
#   - String
#     > lyrics of song according to portion
#   - `#verse`
#     > Appropriate verse of the song with the input interpolated
#   - `#verses`
#     > Verses of the song for range between starting and endpoint
#       in the song.
#   - `#lyrics`
#     > Outputs the entire song from 99 to 0

# Approach
#   - Define class `BeerSong`
#     > No constructor
#     > `#verse`
#       + All verses the same except for 1 and 0
#       + Guard clauses for 1 and 0
#       + Otherwise, return standard phrase with integer
#         interpolated
#         = Use format string?
#     > `#verses`
#       + Iterate over the range and call verse pushing the
#         return value and line separators to a new string
#     > `#lyrics`
#       + Call `#verses` for (99..0)

# Bonus
#   - No if or case statements
#   - Can handle this by storing the lyrics of a song in array
#     form
#     < The indexes of the array would ideally match with the
#       verse
#     < The constructor could create this data structure
#     < The `#verse` and `#verses` methods would just slice/fetch
#       the desired verse(s)
#     < The `#lyrics` method would just join the entire song
#       with a newline
