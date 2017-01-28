# Description:
#   Random jokes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot joke me - Pull a random joke from file

fs = require 'fs'

module.exports = (robot) ->

  file = 'jokes.txt'
  jokes = []

  # Read in jokes file
  do ->
    for line in fs.readFileSync(file).toString().split '\n'
      jokes.push line
    jokes.pop # Get rid of emply last element

  robot.respond /joke me/, (res) ->
    try
      res.send res.random jokes
    catch ex
      res.send "Erm, something went wrong - #{ex}"
      