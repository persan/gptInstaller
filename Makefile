
-include Makefile.conf
SOURCES=share/gnatstudio/support bin

setup:


Makefile.conf:Makefile
	echo "export PREFIX?=$(shell dirname $(shell dirname $(shell which gnat)))" >${@}
	echo "export PATH:=${PATH}" >>${@}

install:
	tar -c ${SOURCES} | (cd ${DESTDIR}/${PREFIX}; tar -x)

uninstall:
	@find ${SOURCES} -type f  >${CURDIR}/_temp.txt
	@find ${SOURCES} -type l >>${CURDIR}/_temp.txt
	@cd ${DESTDIR}${PREFIX}; rm -f $(shell cat ${CURDIR}/_temp.txt)
	@rm_ temp.txt
	

