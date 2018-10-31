# frozen_string_literal: true

require_relative '../input_validator'
require_relative '../base/frame_model'
require_relative '../base/score_board_model'

module Bowling
  class Game
    def start(rolls)
      @frames = FrameModel.new(
        bowls: InputValidator.get_values(rolls),
        remaining_pins: MAX_PINS
      )
      @score = []
      @spare_bonus = @frames.bowls[-1] if @frames.bowls.count == 11
      @strike_bonus = @frames.bowls[-2..-1] if @frames.bowls.count == 12
      get_score(@frames)
      @score_board = ScoreBoardModel.new(
        score: @score,
        bowls: @frames.bowls
      )
      @score_board.total_score
    end

    def sum_frame(frame)
      frame.inject(:+)
    end

    def strike_value(frame)
      return 0 if frame.nil?

      @frames.strike?(frame) ? MAX_PINS : frame[0]
    end

    def score_strike(frame, frame_id)
      if @frames.bowls[frame_id + 1] != @strike_bonus
        sum_frame([
                    strike_value(frame[0]),
                    strike_value(frame[1]),
                    strike_value(@frames.bowls[frame_id + 1]),
                    strike_value(@frames.bowls[frame_id + 2])
                  ])
      else
        sum_frame([
                    strike_value(frame[0]),
                    strike_value(frame[1]),
                    strike_value(@frames.bowls[frame_id + 1])
                  ])
      end
    end

    def score_spare(frame, frame_id)
      sum_frame([MAX_PINS, @frames.bowls[frame_id + 1].to_i])
    end

    def score_gutter(frame)
      frame[0].to_i
    end

    def get_score(frames)
      frames.bowls.each_with_index do |frame, frame_id|
        next if frame_id >= 10

        if @frames.strike?(frame)
          @score.push score_strike(frame, frame_id)
        elsif @frames.spare?(frame)
          @score.push score_spare(frame, frame_id)
        else
          @score.push score_gutter(frame)
        end
      end
    end
  end
end
