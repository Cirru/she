
### Guil: command line to add brackets for Guile.  

Install this by running `npm install -g guil`  

A file `/home/chen/git/guil/examples/test.guil` like this:  

    define (f x y)
      + x y

    display (f 2 3)
    display
      "fucking brackets"

    ; comment

Run `guil /home/chen/git/guil/examples/test.guil`  
Tt will be converted to `/home/chen/git/guil/examples/test.scm`:  

    (define (f x y)
      + x y)
    (display (f 2 3))
    (display
      "fucking brackets")

And keep watching this file and run again.  