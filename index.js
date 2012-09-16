var basename, colors, convert, dirname, exec, extname, filename, fs, fullpath, here, new_name, op, path, run, spawn, _ref;

global.show = console.log;

global.error = function(x) {
  throw new Error(x);
};

fs = require('fs');

path = require('path');

_ref = require('child_process'), exec = _ref.exec, spawn = _ref.spawn;

colors = require('colors');

convert = require('./lib/guil.js').convert;

filename = process.argv[2];

if (filename == null) error('Missing filename!');

extname = path.extname(filename);

if (extname !== '.guil') error('wrong extname!' + extname);

if (filename[0] === '/') {
  fullpath = filename;
} else {
  here = process.env.PWD;
  fullpath = path.join(here, filename);
}

dirname = path.dirname(fullpath);

basename = path.basename(fullpath, '.guil');

new_name = path.join(dirname, basename + '.scm');

(run = function() {
  var file;
  file = fs.readFileSync(fullpath, 'utf8');
  file = convert(file);
  return fs.writeFile(new_name, file, 'utf8', function(err) {
    var output;
    console.log(("runing " + fullpath + "...").red);
    output = spawn("guile", [new_name]);
    output.stdout.setEncoding('utf8');
    output.stderr.setEncoding('utf8');
    output.stdout.on('data', function(chunk) {
      return show(chunk);
    });
    output.stderr.on('data', function(chunk) {
      return show(chunk.red);
    });
    return output.on('exit', function() {
      return show('finished'.blue);
    });
  });
})();

op = {
  interval: 100
};

fs.watchFile(fullpath, op, function(curr, prev) {
  return run();
});
