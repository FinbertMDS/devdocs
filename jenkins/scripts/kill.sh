#!/usr/bin/env bash

echo 'The following command terminates the "mkdocs serve" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when either'
echo '"deliver-for-development.sh" or "deliver-for-development.sh" was executed.'
set -x
kill $(cat .pidfile)