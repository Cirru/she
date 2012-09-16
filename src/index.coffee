
global.show = console.log
global.error = (x) -> throw new Error x

fs = require 'fs'
path = require 'path'
{exec, spawn} = require 'child_process'
colors = require 'colors'

convert = require('./lib/guil.js').convert

filename = process.argv[2]
unless filename? then error 'Missing filename!'
extname = path.extname filename
unless extname is '.guil' then error 'wrong extname!' + extname

if filename[0] is '/' then fullpath = filename else
  here = process.env.PWD
  fullpath = path.join here, filename

dirname = path.dirname fullpath
basename = path.basename fullpath, '.guil'
new_name = path.join dirname, (basename + '.scm')

# show filename, fullpath, new_name

do run = ->
  file = fs.readFileSync fullpath, 'utf8'
  file = convert file
  fs.writeFile new_name, file, 'utf8', (err) ->
    console.log "runing #{fullpath}...".red
    output = spawn "guile", [new_name]
    output.stdout.setEncoding 'utf8'
    output.stderr.setEncoding 'utf8'
    output.stdout.on 'data', (chunk) -> show chunk
    output.stderr.on 'data', (chunk) -> show chunk.red
    output.on 'exit', -> show 'finished'.blue

op = interval: 100
fs.watchFile fullpath, op, (curr, prev) ->
  do run