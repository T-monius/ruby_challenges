# luhn_spike.rb

luhn = 8631.digits
p luhn

def addends(luhn)
  luhn.map.with_index do |digit, idx|
    if idx.odd?
      if (digit * 2) > 9
        (digit * 2) - 9
      else
        digit * 2
      end
    else
      digit
    end
  end
end

p addends(luhn)
