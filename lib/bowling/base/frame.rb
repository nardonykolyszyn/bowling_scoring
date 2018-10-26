# frozen_string_literal: true

module Bowling
  class Frame < Base
    attr_accessor :name
    MAX_PINS = 10
    STRIKE = 'X'
    SPARE = '/'
    GUTTER = '-'
  end
end
