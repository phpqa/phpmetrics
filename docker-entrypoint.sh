#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpmetrics "$@"
elif [ "$1" = "/composer/vendor/bin/phpmetrics" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpmetrics" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpmetrics "$@"
fi

exec "$@"
