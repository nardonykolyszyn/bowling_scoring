# frozen_string_literal: true

require 'optparse'

OPTIONS = {}

parser = OptionParser.new do |ps|
  ps.banner = 'Usage: ruby scoring.rb --help'

  ps.on('-', '--data-input', 'Data location') do |input|
    OPTIONS[:input] = input
  end
end

parser.parse!
