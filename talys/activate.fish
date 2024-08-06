#!/usr/bin/env fish

if set -q TALYSDIR
    set -gx CONDA_BACKUP_TALYSDIR "$TALYSDIR"
end

set -gx TALYSDIR "$CONDA_PREFIX/share/talys"
