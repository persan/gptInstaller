#!/usr/bin/make -f

-include Makefile.conf

setup:Makefile.conf

PROJECT:=project_name.gpr
GPRBUILDFLAGS:=-p
Makefile.conf:
	echo "export PREFIX:=$(shell dirname $(shell dirname $(shell which gnat)))" >${@}
	echo "export PATH:=${PATH}" >>${@}


compile:
	gprbuild  -P ${PROJECT} ${GPRBUILDFLAGS}

test:
	${MAKE} -C test all

install:
	gprinstall  -P ${PROJECT} ${GPRBUILDFLAGS}



