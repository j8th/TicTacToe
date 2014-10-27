#!/usr/bin/env ruby

require_relative 'lib/game'
require_relative 'lib/human'
require_relative 'lib/ai'
require_relative 'lib/board'
require_relative 'lib/app'
require_relative 'lib/ui'
require_relative 'lib/console'



ui = Console.new
# Possibly in the future?
# ui = Web.new
app = App.new(ui)
app.run

