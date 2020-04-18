# beer_song.rb

require 'pry'

class BeerSong
  STANDARD_PHRASE = "%s bottles of beer on the wall, %s bottles of beer.\n" \
                    "Take one down and pass it around, %s bottle%s of beer on the wall.\n"
  PENULTIMATE_PHRASE = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
                       "Take it down and pass it around, no more bottles of beer on the wall.\n"
  LAST_LINE = "No more bottles of beer on the wall, no more bottles of beer.\n" \
              "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  def verse(number)
    return LAST_LINE if number.zero?
    return PENULTIMATE_PHRASE if number == 1
    bottles_or_bottle = ''
    number > 2 ? bottles_or_bottle = 's' : bottles_or_bottle
    STANDARD_PHRASE.clone % [number, number, number - 1, bottles_or_bottle]
  end

  def verses(first_verse, final_verse)
    song = ''
    (first_verse).downto(final_verse) do |number|
      song << verse(number) << "\n"
    end
    song.chomp
  end

  def lyrics
    verses(99, 0)
  end
end
