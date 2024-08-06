#!/usr/bin/env fish

if set -q CONDA_BACKUP_TALYSDIR
    set -gx TALYSDIR "$CONDA_BACKUP_TALYSDIR"
    set -e CONDA_BACKUP_TALYSDIR
else
    set -e TALYSDIR
end
