
{print} = require "util"
{spawn, exec} = require "child_process"

echo = (child, callback) ->
  child.stderr.on "data", (data) -> print data.toString()
  child.stdout.on "data", (data) -> print data.toString()
  child.on "exit", (code) -> callback?() if code is 0

make = (str) -> str.split " "
d = __dirname

queue = [
  "jade -O #{d}/bin/ -wP #{d}/src/index.jade"
  "stylus -o #{d}/bin/ -w #{d}/src/"
  "coffee -o #{d}/bin/ -wb #{d}/src/"
  "doodle #{d}/bin/"
]

split = (str) -> str.split " "

task "dev", "watch and convert files", (callback) ->
  queue.map(split).forEach (array) ->
    echo (spawn array[0], array[1..]), callback