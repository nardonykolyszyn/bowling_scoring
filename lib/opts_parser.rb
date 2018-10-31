# frozen_string_literal: true

require 'optparse'

OPTIONS = {}

OptionParser.new do |opts|
  usage = 'ruby scoring.rb -p XXXXXXXXXXXX'
  opts.banner = 'Usage: example.rb [options]'

  opts.on('-p pattern', '--pattern=pattern', 'Pattern which you wish to scan', usage) do |p|
    OPTIONS[:pattern] = p
  end
end.parse!