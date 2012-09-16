var convert, good_indent, markup, not_comment, not_empty, odd, trimRight;

markup = require('./sugar').markup;

odd = function(num) {
  return (num % 2) !== 0;
};

good_indent = function(line) {
  var info, spaces;
  spaces = line.match(/^\s*/)[0];
  if (odd(spaces.length)) {
    info = 'odd indentations: ';
    info += line.replace(/\s/g, '+');
    if (typeof error !== "undefined" && error !== null) error(info);
    throw error;
  } else {
    return true;
  }
};

not_empty = function(line) {
  return line.trim().length > 0;
};

not_comment = function(line) {
  return line.trim()[0] !== ';';
};

trimRight = function(line) {
  return line.trimRight();
};

convert = function(str) {
  var arr;
  arr = str.split('\n').filter(good_indent).filter(not_empty).filter(not_comment).map(trimRight);
  return (markup(arr)).join('\n');
};

exports.convert = convert;
