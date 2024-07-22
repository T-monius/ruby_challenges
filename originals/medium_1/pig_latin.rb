# pig_latin.rb

# This class provides a method to translate any string of words
# into its 'pig latin' translation.
class PigLatin
  VOWELS = /[aeiou]/
  CONSONANTS_MINUS_XY = /[^aeiouxy]/

  def self.translate(str)
    words = str.split
    words = words.map do |word|
      if swap_three_letters?(word)
        append_ay(three_constant_swap(word))
      elsif swap_two_letters?(word)
        append_ay(two_consonant_swap(word))
      elsif swap_one_letter?(word)
        append_ay(consonant_swap(word))
      else
        append_ay(word)
      end
    end
    words.join(' ')
  end

  def self.swap_three_letters?(word)
    first_position = [/thr/, /sch/]
    second_position = /qu/
    return true if first_position.any? { |match| (word =~ match) == 0 }
    return true if (word =~ second_position) == 1
    false
  end

  def self.swap_two_letters?(word)
    first_position = [/ch/, /qu/, /th/]
    return true if first_position.any? { |match| (word =~ match) == 0 }
    false
  end

  def self.swap_one_letter?(word)
    first_position = [/x/, /y/]
    second_position = VOWELS
    return true if (word =~ CONSONANTS_MINUS_XY) == 0
    if first_position.any? do |match|
         ((word =~ match) == 0) &&
         ((word =~ second_position) == 1)
       end
      return true
    end
    false
  end

  def self.append_ay(word)
    word << 'ay'
  end

  def self.consonant_swap(word)
    word << word[0]
    word[0] = ''
    word
  end

  def self.two_consonant_swap(word)
    word << word[0..1]
    2.times { word[0] = '' }
    word
  end

  def self.three_constant_swap(word)
    word << word[0..2]
    3.times { word[0] = '' }
    word
  end
end
