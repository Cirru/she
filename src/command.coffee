
show = console.log
error = (x) -> throw new Error x

fs = require 'fs'
path = require 'path'
require 'seajs'
{convert} = require('./lines')
# clc = require 'cli-color'

args = process.argv[2..]

is_op = (str) -> str[0] is '-'

short = (str) ->
  if str is '--output' then '-o'
  else if str is '--quick' then '-q'
  else if str is '--help' then '-h'
  else str

args = args.map short

if '-h' in args
  show '\n'
  show 'she is a tool to help you write less brackets in Scheme\n'
  show '-o   --output      set output file name'
  show '-h   --help        show help\n'
  show 'This is only a small tool, find she on Github'
  show 'You may folk the repo to improve she.\n'
  process.exit()

output = undefined
output_op = undefined
quick_op = undefined
input = []

# show args

args.forEach (item) ->
  if output_op?
    output = item
    output_op = undefined
  else if is_op item
    if item is '-o' then output_op = 'now on'
    else if item is '-q' then quick_op = 'now on'
    else
      show 'option not recognized: ', item
      process.exit()
  else
    input.push item

# show output, input, quick_op

input.forEach (file) ->
  if output?
    if fs.existsSync(output)
      if fs.statSync(output).isDirectory()
        name = path.basename file
        target = path.join output, name.replace(/\.\w+$/, '.scm')
      else target = output
    else target = output
  else target = file.replace /\.\w+$/, '.scm'

  # show target

  do run = ->
    fs.readFile file, 'utf8', (err, data) ->
      throw err if err?
      fs.writeFile target, (convert data), ->
        # time = new Date().getTime().toString()
        # n1 = Math.floor (Math.random() * 256)
        # n2 = Math.floor (Math.random() * 256)
        # draw = clc.xterm(n1).bgXterm(n2)
        # show (draw time[-7..]), target

  # show 'quick_op', quick_op
  unless quick_op?
    fs.watchFile file, interval: 200, run