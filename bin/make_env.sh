#!/usr/bin/env bash
set -euxo pipefail
cd $(dirname $0)/..
PWD=$(pwd)

touch ${PWD}/.env
echo "UID=$(id -u ${USER})" >> ${PWD}/.env
echo "GID=$(id -g ${USER})" >> ${PWD}/.env
