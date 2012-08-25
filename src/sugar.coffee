
ss = (line) -> line.match(/^\s*/)[0]

read = (line) -> (ss line).length / 2

more = (s, n) ->
  str = ''
  [0...n].forEach -> str += s
  str

close_left = (line, n) ->
  s = '('
  it = more s, n
  head = ss line
  tail = line.trim()
  head + it + tail

close_right = (line, n) ->
  s = ')'
  it = more s, n
  head = ss line
  tail = line.trim()
  head + tail + it

cal_left = (curr, prev, next) ->
  c = read curr
  p = read prev
  diff = c - p
  ret = if diff > 1 then diff else 1
  if single curr, prev, next
    if ret > 0 then ret -= 1
  ret

cal_right = (curr, prev, next) ->
  c = read curr
  n = read next
  diff = c - n
  ret = if diff >= 0 then (diff + 1) else 0
  if single curr, prev, next
    if ret > 0 then ret -= 1
  ret

get = (arr, i) -> if arr[i]? then arr[i] else ''

continous = (line) ->
  show line
  line = line.trim()
  h = line[0]
  p = line.indexOf ' '
  (h in ['"', "'"]) or (p < 0)

single = (curr, prev, next) ->
  p = read prev
  c = read curr
  n = read next
  # show p, c, n
  rule1 = c > 0
  rule2 = n <= c
  rule3 = continous curr
  show rule3
  rule1 and (rule2 or rule3)

deal = (line, i, arr) ->
  prev = get arr, (i - 1)
  next = get arr, (i + 1)
  n1 = cal_left line, prev, next
  line = close_left line, n1
  n2 = cal_right line, prev, next
  line = close_right line, n2

markup = (arr) ->
  ret = []
  for line, i in arr
    ret.push (deal line, i, arr)
  ret

exports.markup = markup