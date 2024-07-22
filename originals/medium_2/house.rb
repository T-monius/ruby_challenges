# house.rb

class House
  STARTING_PHRASE = 'This is '

  def build_verse(num)
    idx = -1

    verse = []

    loop do
      break if idx.abs == num

      current_array = pieces_array[idx]
      next_array = pieces_array[idx - 1]
      line = "#{next_array[1]} #{current_array[0]}"
      line << '.' if idx == -1
      verse.unshift(line)
      idx -= 1
    end

    first_line = STARTING_PHRASE.clone + pieces_array[idx][0]
    first_line << '.' if idx == -1
    verse.unshift(first_line).join("\n")
  end

  def build_poem
    poem_size = pieces.size
    poem = []

    poem_size.times { |idx| poem << build_verse(idx + 1) }
    poem.join("\n\n")
  end

  def self.recite
    house = House.new
    house.build_poem + "\n"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
