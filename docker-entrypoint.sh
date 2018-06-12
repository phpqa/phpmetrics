#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpmetrics "$@"
elif [ "$1" = "/vendor/bin/phpmetrics" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpmetrics" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpmetrics "$@"
fi

exec "$@"
