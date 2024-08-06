#!/usr/bin/env bash

# preserve the user's existing setting
if [ ! -z "${TALYSDIR+x}" ]; then
  export CONDA_BACKUP_TALYSDIR="${TALYSDIR}"
fi

export TALYSDIR="${CONDA_PREFIX}/share/talys"
