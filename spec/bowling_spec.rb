# frozen_string_literal: true

require 'spec_helper'
require './lib/bowling'

describe Bowling do
  let(:perfect_game) { Bowling::Game.new('XXXXXXXXXXXX') }
  let(:game_with_spares) { Bowling::Game.new('5/5/5/5/5/5/5/5/5/5/5') }
  let(:game_with_gutters) { Bowling::Game.new('9-9-9-9-9-9-9-9-9-9-') }

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

  # Game with spares specs

  it 'should return 150 as score' do
    expect(game_with_spares.score.inject(:+)).to eq 150
  end

  # Game with gutters

  it 'should return 90 as score' do
    expect(game_with_gutters.score.inject(:+)).to eq 90
  end

  # Arguments specs

  it 'should reject if game has more than 12 pairs' do
    expect { Bowling::Game.new('9-9-9-9-9-9-9-9-9-9-9-9-9-9-9-9-9-') }.to raise_error(ArgumentError)
  end

  it 'should raise error if takes more than 12 strikes' do
    expect { Bowling::Game.new('XXXXXXXXXXXXX') }.to raise_error(ArgumentError)
  end
end
