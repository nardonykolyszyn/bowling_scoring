# frozen_string_literal: true

require 'spec_helper'
require './lib/bowling'

describe Bowling do
  let(:perfect_game) { Bowling::Game.new('XXXXXXXXXXXX') }

  # Perfect game specs

  it 'should return 300 as score' do
    expect(perfect_game.score.inject(:+)).to eq 300
  end

  it 'should return 12 as pairs' do
    expect(perfect_game.frames.bowls.size).to eq 12
  end

  it 'should return an exception' do
    expect { Bowling::Game.new }.to raise_error(ArgumentError)
  end
end
