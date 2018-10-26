# frozen_string_literal: true

module Bowling
  class Base
    attr_reader :attrs

    def initialize(attrs = {})
      puts attrs
      return if attrs.nil? || attrs.empty?

      attrs.each do |key, value|
        send(:"#{key}=", value) if respond_to?(:"#{key}=")
      end
    end
  end
end
