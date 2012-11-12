// Generated by CoffeeScript 1.4.0

define(function(require, exports) {
  var codearea, convert, default_code, query, render, result, show, source;
  show = function(x) {
    return console.log(x);
  };
  query = function(id) {
    return document.querySelector(id);
  };
  codearea = require('../../codearea/codearea').codearea;
  source = query('#source');
  result = query('#result');
  codearea(source);
  convert = require('./lines').convert;
  default_code = localStorage.getItem('code');
  source.focus();
  (render = function() {
    var code, value;
    value = source.value;
    localStorage.setItem('code', value);
    code = convert(value);
    return result.innerHTML = "<pre>" + code + "</pre>";
  })();
  source.addEventListener('keyup', render);
});