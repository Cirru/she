
echo '-- start watching'

coffee -o lib/ -wb src/guil.coffee &
coffee -o lib/ -wb src/sugar.coffee &
coffee -o ./ -wb src/index.coffee &
node-dev bin/guil examples/test.guil examples/test.guil&

read

pkill -f coffee
pkill -f node-dev

echo '-- stop watching'