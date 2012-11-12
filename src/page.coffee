


define (require, exports) ->

  show = (x) -> console.log x
  query = (id) -> document.querySelector id

  {codearea} = require('../../codearea/codearea')
  source = query '#source'
  result = query '#result'
  codearea source

  {convert} = require('./lines')

  default_code = localStorage.getItem 'code'
  # if default_code.trim().length > 0
  #   source.value = default_code
  source.focus()

  do render = ->
    value = source.value
    localStorage.setItem 'code', value
    code = convert value
    result.innerHTML =  "<pre>#{code}</pre>"
  source.addEventListener 'keyup', render

  return