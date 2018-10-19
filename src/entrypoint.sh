#!/usr/bin/env bash

if [ "${INIT_DEBUG}" == true ]; then
    set -x
fi

exec ${ROOT_DIR}/run.sh
