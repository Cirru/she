
## She is a command-line tool to add brackets

I admire Lisp, but there are flaws I really don't like.  

* One is Lisp lack of libraries to deal with daily works.  
As a result, I can't use Lisp at any place as I like.  
To this case, I'm now trying to learn Chicken Scheme, hope it will be good.

* The second is the syntax, too many bracks here in Lisp.  
I was trying hard looking for some alternative methods to escape from that.  
There is a related [specification][spec], but I failed to make it work. T_T  
Influenced by code transformation of Node Community, I wrote she.  

The name.. as Scheme use `.scm` as a filename extenson,  
I try to see Scheme from another view, and it's ScHEme, rather than SCheMe.

#### Instalation ''

She is writtern in CoffeeScript and packaged as a NPM module.  
Just install via npm (maybe need use `sudo`):  
```bash
npm install -g she
```

Option `-o` spectifies the following pathname to be the output path.  
If that's a directory, just the directory, or, to be a file.  
Option `-q` means to run command only one time to compile it.  
By default, `she` blocks the terminal to watch the files.  
And there has not bene special rules for the extension name by now.  

So `she file.she -o dir/ &` fits better to me, and you if you like.  
Better to heck [`reload-cli`][reload]. I usually combine them togather as live coding.

[reload]: https://github.com/jiyinyiyong/reload-cli
[spec]: http://srfi.schemers.org/srfi-49/srfi-49.html