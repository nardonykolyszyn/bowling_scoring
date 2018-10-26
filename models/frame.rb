# frozen_string_literal: true

class Frame
  MAX_PINS = 10
  STRIKE = 'X'
  SPARE = '/'
  GUTTER = '-'

  def initialize
    @bowls = []
    @remaining_pins = MAX_PINS
  end

  def bowl(pins)
  end
end