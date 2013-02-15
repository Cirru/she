
define (require, exports) ->
  markup = require('./brackets').markup
  error = (info) -> console.log 'error:', info

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
  is_empty = (line) -> line.trim().length is 0

  not_comment = (line) -> line.trim()[0] isnt ';'
  is_comment = (line) -> line.trim()[0] is ';'

  is_shebang = (line) -> line.trim()[0] is '#'

  trimRight = (line) -> line.trimRight()

  convert = (str) ->
    lines = str.split('\n').map(trimRight)
    mapping = []
    code = []
    n = -1
    lines.forEach (item) ->
      n += 1
      if is_comment item
        mapping[n] = item
      else if is_empty item
        mapping[n] = item
      else if is_shebang item
        mapping[n] = item
      else
        code.push item
    code = markup code

    restult = []

    # console.log 'mapping', mapping

    [0...lines.length].forEach (n) ->
      if mapping[n]? then restult.push mapping[n]
      else restult.push code.shift()

    restult.join '\n'

  exports.convert = convert

  return