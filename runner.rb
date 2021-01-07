require_relative 'config/environment'
require 'colorize'
require 'io/console'

cli = Cli.new 
#pid = fork{ exec 'killall', "afplay"}
cli.start_game
pid = fork{ exec 'killall', "afplay"}
binding.pry



