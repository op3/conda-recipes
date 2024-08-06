#!/usr/bin/env csh

if ($?TALYSDIR) then
	setenv TALYSDIR "${CONDA_BACKUP_TALYSDIR}"
	unsetenv CONDA_BACKUP_TALYSDIR
else
	unsetenv TALYSDIR
endif
