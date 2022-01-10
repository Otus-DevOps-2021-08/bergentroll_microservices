#!/bin/bash

set -e

# FIXME Instruction points on system mongodb.conf
/usr/bin/mongod --fork --logpath /var/log/mongod.log --config /etc/mongod.conf

# shellcheck source=/dev/null
source "${REDDIT_DIR}/db_config"

cd "${REDDIT_DIR}"
puma
