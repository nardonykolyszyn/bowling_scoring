# frozen_string_literal: true

require './lib/bowling'
require './lib/opts_parser'

# Init game based in the input
game = Bowling::Game.new(OPTIONS[:pattern])
game.final_score
