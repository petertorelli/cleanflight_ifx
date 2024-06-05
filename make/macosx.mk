# macosx.mk
#
# Goals:
#   Configure an environment that will allow Taulabs GCS and firmware to be built
#   on a Mac OSX system. The environment will support the current version of the
#   ARM toolchain installed to either their respective default installation
#   locations, the tools directory or made available on the system path.

# Original code was looking for python2 specifically, don't have it, so
# just find one (note, behavior of shell `which` differs from /usr/bin/which)
ifeq ($(shell /usr/bin/which -s python3; echo $$?), 0)
	PYTHON:=python3
else ifeq ($(shell /usr/bin/which -s python2; echo $$?), 0)
	PYTHON:=python2
else ifeq ($(shell /usr/bin/which -s python; echo $$?), 0)
	PYTHON:=python
else
$(error No python found)
endif

export PYTHON
