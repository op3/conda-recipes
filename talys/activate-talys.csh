#!/usr/bin/env csh

if ($?TALYSDIR) then
	setenv CONDA_BACKUP_TALYSDIR "${TALYSDIR}"
endif

setenv TALYSDIR "${CONDA_PREFIX}/share/talys"
