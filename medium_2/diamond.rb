# diamond.rb

class Diamond
  def self.make_diamond(hump_letter)
    diamond = ""
    current_letter = "A"
    outer_spaces = hump_letter.ord - "A".ord
    inner_spaces = 0
    increment_inner_spaces = true
    loop do
      diamond << " " * outer_spaces
      diamond << current_letter
      diamond << " " * inner_spaces unless inner_spaces < 0
      diamond << current_letter unless current_letter == "A"
      diamond << " " * outer_spaces + "\n"
      break if hump_letter == 'A'
      break if current_letter == 'A' && diamond.count('A-Z') > 1 &&
               hump_letter != 'A'
      increment_inner_spaces = false if current_letter == hump_letter
      if increment_inner_spaces
        current_letter == 'A' ? inner_spaces += 1 : inner_spaces += 2
        outer_spaces -= 1
        current_letter = current_letter.next
      else
        inner_spaces -= 2 
        outer_spaces += 1
        current_letter = (current_letter.ord - 1).chr
      end
    end
    diamond
  end
end
