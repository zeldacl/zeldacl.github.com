#!/bin/sh

LISP=sbcl

cd `dirname "$0"`
rm -rf blog

rm -rf /tmp/coleslaw

cp source/.coleslawrc ~/

if [ $LISP = sbcl ]; then
  sbcl --eval "(ql:quickload 'coleslaw)" \
  --eval "(coleslaw:main \"`pwd`/source\")" \
  --eval "(uiop:quit)"
elif [ $LISP = ccl ]; then
  ccl -e "(ql:quickload 'coleslaw)" \
  -e "(coleslaw:main \"`pwd`/source\")" \
  -e "(uiop:quit)"
else
  echo -e "$LISP is not a supported lisp dialect at this time. Exiting.\n"
  exit 1
fi

mv output/blog .
rm -rf output
