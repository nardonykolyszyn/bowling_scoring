# frozen_string_literal: true

require './lib/bowling'
require './lib/opts_parser'

# Init game based in the input
Bowling::Game.new(OPTIONS[:pattern])