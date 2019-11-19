
-include Makefile.conf

SOURCES += share/gnatstudio/support
SOURCES += bin
SOURCES += share/gnatstudio/templates/templateTemplate

	
setup:${HOME}/.gnatstudio/plug-ins/templates_in_home.py
${HOME}/.gnatstudio/plug-ins:
	mkdir -p ${HOME}/.gnatstudio/plug-ins

${HOME}/.gnatstudio/plug-ins/templates_in_home.py:templates_in_home.py ${HOME}/.gnatstudio/plug-ins
	cp ${<} ${@}

Makefile.conf:Makefile
	@echo "export PREFIX?=$(shell dirname $(shell dirname $(shell which gnat)))" >${@}
	@echo "export PATH:=${PATH}" >>${@}

install:
	@mkdir -p ${DESTDIR}${PREFIX}
	tar -c ${SOURCES} | (cd ${DESTDIR}${PREFIX}; tar -x)

uninstall:
	@find ${SOURCES} -type f  >${CURDIR}/_temp.txt
	@find ${SOURCES} -type l >>${CURDIR}/_temp.txt
	@cd ${DESTDIR}${PREFIX}; rm -f $(shell cat ${CURDIR}/_temp.txt)
	@rm -f temp.txt


clean:
	git clean -xdf
