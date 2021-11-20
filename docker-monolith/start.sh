#!/bin/bash

set -e

/usr/bin/mongod --fork --logpath /var/log/mongod.log --config /etc/mongodb.conf

# shellcheck source=/dev/null
source "${REDDIT_DIR}/db_config"

cd "${REDDIT_DIR}"
puma
