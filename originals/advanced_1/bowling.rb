# bowling.rb

require 'pry'

class Game
  attr_accessor :all_frames
  
  def initialize
    self.all_frames = [[]]
  end

  def roll(pins)
    pin_value_validation(pins)
    validate_pins_on_lane(pins)
    add_new_frame unless play_current_frame?
    current_frame << pins
  end

  def score
    # invalid_time_to_take_score
    total = 0
    all_frames.each_with_index do |frame, frame_idx|
      if strike?(frame)
        total += 10 + next_roll(frame_idx) + roll_after_next(frame_idx)
      elsif spare?(frame)
        total += 10 + next_roll(frame_idx)
      else
        total += frame_total(frame)
      end
    end
    total
  end

  private

  def pin_value_validation(pins)
    raise 'Pins must have a value from 0 to 10' unless (0..10).include?(pins)
  end

  def validate_pins_on_lane(pins)
    msg = 'Pin count exceeds pins on the lane'
    raise msg if play_current_frame? && pin_mismatch?(pins) && !fill_ball?
  end

  def pin_mismatch?(pins)
    return false unless all_frames[-1][0]
    # it final frame first strike and not final frame second strike
    #   Make sure the last two pins don't add to more then 10
    if all_frames.length == 10 && final_frame_first_strike? &&
      !final_frame_second_strike? && current_frame.length == 2
      binding.pry
      return true if current_frame[1] + pins > 10
    end
    (all_frames[-1][0] + pins) > 10
  end

  def play_current_frame? #(pins)
    return true if fill_ball? # && !pin_mismatch?(pins)
    current_frame.length < 2 && current_frame[0] != 10
  end

  def add_new_frame
    all_frames << []
  end

  def current_frame
    all_frames[-1]
  end

  def strike?(frame)
    frame[0] == 10 && frame.length == 1
  end

  def spare?(frame)
    frame_total(frame) == 10 && frame.length == 2
  end

  def frame_total(frame)
    frame.reduce(:+)
  end

  def next_roll(frame_idx)
    all_frames[frame_idx + 1][0]
  end

  def roll_after_next(frame_idx)
    all_frames[frame_idx + 1][1] || all_frames[frame_idx + 2][0]
  end

  def fill_ball?
     roll_final_frame_first_strike? || roll_final_frame_second_strike? ||
                                  final_frame_spare?
  end

  def final_frame_first_strike?
    all_frames.length == 10 && current_frame[0] == 10
  end

  def final_frame_second_strike?
    all_frames.length == 10 && final_frame_first_strike? &&
                               current_frame[1] == 10
  end

  def roll_final_frame_first_strike?
    final_frame_first_strike? && current_frame.length == 1
  end

  def roll_final_frame_second_strike?
    final_frame_second_strike? && current_frame.length == 2 &&
                                  current_frame[1] == 10
  end

  def final_frame_spare?
    all_frames.length == 10 && current_frame.length == 2 &&
                               current_frame.reduce(:+) == 10 &&
                               current_frame[0] != 0 &&
                               current_frame[1] != 0
  end

  # def invalid_time_to_take_score
  #   msg = 'Score cannot be taken until the end of the game'
  #   raise msg unless all_frames.length == 10 && final_frame_complete?
  # end

  def final_frame_complete?
    if roll_final_frame_first_strike? || roll_final_frame_second_strike? ||
       final_frame_spare?
      current_frame.length == 3
    else
      current_frame == 2
    end
  end
end

def roll_n_times(game, rolls, pins)
  rolls.times do
    game.roll(pins)
  end
end
