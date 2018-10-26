# frozen_string_literal: true

require 'ostruct'
# Valid attributes
# ================

class ScoreBoard
  def new(attributes)
  end

  def announce_player
    puts "#{current_player.name} to bowl"
  end
end