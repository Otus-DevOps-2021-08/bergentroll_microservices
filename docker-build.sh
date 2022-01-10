#! /bin/bash

# docker build wrapper script should be ran at root of the repo

set -e

export USER_NAME='bergentroll'

for i in 'ui' 'post-py' 'comment'; do
  pushd "src/${i}"
  bash docker_build.sh
  popd
done
