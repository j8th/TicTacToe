#!/usr/bin/env ruby

require_relative 'lib/game'
require_relative 'lib/human'
require_relative 'lib/ai'
require_relative 'lib/board'
require_relative 'lib/app'

require 'optparse'


options = {}
OptionParser.new do |opts|
  	opts.banner = "Usage: TicTacToe.rb [--debug]"

	opts.on("--debug", "Run with debugging output.") do |d|
  		options[:debug] = d
  	end
end.parse!


$DEBUG = options[:debug]



app = App.new( )
app.run

