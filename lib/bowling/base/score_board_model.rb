# frozen_string_literal: true

require_relative '../active_support/deep_symbolize_keys'

module Bowling
  using SymbolizeHelper
  class ScoreBoardModel < Base
    attr_accessor :score, :bowls

    def total_score
      {
        score: score.inject(:+),
        rolls: rolls,
        pairs: pairs.size
      }.deep_symbolize_keys
    end

    def pairs
      bowls.delete_if { |e| e.length <= 1 unless e.include? STRIKE }
    end

    def rolls
      bowls.length
    end
  end
end
