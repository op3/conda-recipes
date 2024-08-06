#!/usr/bin/env bash

# reinstate the backup from outside the environment
if [ ! -z "${CONDA_BACKUP_TALYSDIR}" ]; then
  export TALYSDIR="${CONDA_BACKUP_TALYSDIR}"
  unset CONDA_BACKUP_TALYSDIR
# no backup, just unset
else
  unset TALYSDIR
fi
