# frozen_string_literal: true

require 'ostruct'
# Valid attributes
# ================
# :name => String  : Required
# :alias => String : Optional

class Player
  def new(attributes)
    @name = attributes[:name]
    @devpolish = attributes[:alias]
    @frames = []
  end
end