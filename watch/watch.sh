
coffee -o ../lib/ -wb ../src/guil.coffee &
coffee -o ../lib/ -wb ../src/sugar.coffee &
coffee -o ../ -wb ../src/index.coffee &
node-dev ../bin/guil ../examples/test.guil &