
cd `dirname $0`
subl -a .

echo '-- start watching'

coffee -o bin/ -wb src/*coffee &
jade -O bin/ -wP src/*jade &
stylus -o bin/ -w src/*styl &
doodle bin/ &
# node-dev bin/guil examples/test.guil examples/test.guil &

read

pkill -f coffee
# pkill -f node-dev
pkill -f jade
pkill -f stylus
pkill -f doodle

echo '-- stop watching'