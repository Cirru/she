(let*
    ((yin
        ((lambda (foo) (newline) foo)
        (call/cc (lambda (bar) bar))))
    (yang
        ((lambda (foo) (write-char #\*) foo)
        (call/cc (lambda (bar) bar)))))
  (yin yang))