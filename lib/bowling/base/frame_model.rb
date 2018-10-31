# frozen_string_literal: true

module Bowling
  class FrameModel < Base
    attr_accessor :bowls, :remaining_pins

    def initialize(attrs = {})
      super
      check_strikes
    end

    def strike?(bowl)
      return false if bowl.nil?

      bowl.include? STRIKE
    end

    def spare?(bowl)
      return false if bowl.nil?

      !strike?(bowl) && bowl.include?(SPARE)
    end

    private

    def check_strikes
      @bowls = @bowls.map! { |e| strike?(e) ? e.scan(/./) : e }.flatten
    end
  end
end
