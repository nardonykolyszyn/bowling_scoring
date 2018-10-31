# frozen_string_literal: true

require 'pp'
require 'colorize'

module Bowling
  class ScoreBoardModel < Base
    attr_accessor :score, :bowls

    def total_score
      puts "Score #{score.inject(:+)}".green
      puts "Rolls #{rolls}".yellow
      puts "Pairs #{pairs.size}".red
    end

    def pairs
      bowls.delete_if { |e| e.length <= 1 unless e.include? STRIKE }
    end

    def rolls
      bowls.join('').length
    end
  end
end
