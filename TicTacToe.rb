#!/usr/bin/env ruby

require_relative 'lib/game'
require_relative 'lib/players/human'
require_relative 'lib/players/ai'
require_relative 'lib/board'
require_relative 'lib/rules'
require_relative 'lib/ui/console'
require_relative 'lib/app'



rules = Rules.new
ui = Console.new
# Possibly in the future?
# ui = Web.new
app = App.new(rules, ui)
app.run

