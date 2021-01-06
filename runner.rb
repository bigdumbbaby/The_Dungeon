require_relative 'config/environment'
require 'colorize'
require 'io/console'

cli = Cli.new 
#pid = fork{ exec 'killall', "afplay"}
pid = fork{ exec 'afplay', 'lib/mp3/Fogweaver.mp3' }
cli.start_game
pid = fork{ exec 'killall', "afplay"}
binding.pry



