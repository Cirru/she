
markup = require('./sugar').markup

odd = (num) -> (num % 2) isnt 0

good_indent = (line) ->
  spaces = line.match(/^\s*/)[0]
  if odd spaces.length
    info = 'odd indentations: '
    info += line.replace(/\s/g, '+')
    error info if error?
    throw error
  else true

not_empty = (line) -> line.trim().length > 0

not_comment = (line) -> line.trim()[0] isnt ';'

trimRight = (line) -> line.trimRight()

convert = (str) ->
  arr = str
    .split('\n')
    .filter(good_indent)
    .filter(not_empty)
    .filter(not_comment)
    .map(trimRight)
  (markup arr).join '\n'

exports.convert = convert