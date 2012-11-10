
### Guil: command line to add brackets for Guile.  

Install this by running `npm install -g guil`  

A file `test.guil` like this:  

```scheme
define (f x y)
  + x y

display (f 2 3)
display
  "fucking brackets"

; comment
```

Run `guil test.guil`  
It will be converted to `test.scm`:  

```scheme
(define (f x y)
  (+ x y))
(display (f 2 3))
(display
  "fucking brackets")
```

Multiple files are supported. `guil` just compiles.  