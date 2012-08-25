var basename, colors, convert, dirname, exec, extname, filename, fs, fullpath, here, new_name, op, path, run;

global.show = console.log;

global.error = function(x) {
  throw new Error(x);
};

fs = require('fs');

path = require('path');

exec = require('child_process').exec;

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
    console.log(("runing " + fullpath + "...").red);
    return exec("guile " + new_name, function(err, stdout, stderr) {
      if (err != null) {
        throw err;
      } else {
        console.log('>>>'.blue, stdout);
        console.log('--------------'.blue);
        return console.log(stderr.red);
      }
    });
  });
})();

op = {
  interval: 100
};

fs.watchFile(fullpath, op, function(curr, prev) {
  return run();
});
