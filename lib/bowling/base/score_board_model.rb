# frozen_string_literal: true

module Bowling
  class ScoreBoardModel < Base
    attr_accessor :score, :bowls

    def total_score
      {
        score: score.inject(:+),
        rolls: rolls,
        pairs: pairs.size
      }
    end

    def pairs
      bowls.delete_if { |e| e.length <= 1 unless e.include? STRIKE }
    end

    def rolls
      bowls.length
    end
  end
end
