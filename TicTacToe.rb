#!/usr/bin/env ruby

require_relative 'lib/game'
require_relative 'lib/players/human'
require_relative 'lib/players/ai'
require_relative 'lib/board'
require_relative 'lib/app'
require_relative 'lib/ui/console'



ui = Console.new
# Possibly in the future?
# ui = Web.new
app = App.new(ui)
app.run

