# frozen_string_literal: true

require './lib/bowling'
require './lib/opts_parser'
require 'colorize'

# Init game based in the input
game = Bowling::Game.new(OPTIONS[:pattern])
# Print result
game.final_score.each { |k, v| puts "#{k} is #{v}".light_green }
