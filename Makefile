
-include Makefile.conf

SOURCES=share/gnatstudio/support
SOURCES+=share/gnatstudio/templates/templateTemplate
SOURCES+=bin
	
setup:
	@mkdir -p tests
	@true

Makefile.conf:Makefile
	echo "export PREFIX?= $(shell dirname $(shell dirname $(shell which gnatls)))" >${@}
	echo "export PATH:=${CURDIR}/bin:${PATH}" >>${@}

${CURDIR}/sources.txt:${shell find ${SOURCES} -type f} Makefile
	@for i in ${SOURCES} ; do \
		git clean -dxf $${i}; \
	done
	find ${SOURCES} -type f>${@}
	find ${SOURCES} -type l>>${@}
	@chmod a+wr ${@}
install:${CURDIR}/sources.txt
	mkdir -p ${DESTDIR}${PREFIX}/share/gptInstaller
	tar -c `cat ${<}` | (cd ${DESTDIR}${PREFIX}; tar -x)
	cat ${CURDIR}/sources.txt >${DESTDIR}${PREFIX}/share/gptInstaller/manifest

uninstall:${CURDIR}/sources.txt
	@echo ${DESTDIR}${PREFIX}
	@cd ${DESTDIR}${PREFIX};pwd ;rm -f `cat share/gptInstaller/manifest`

clean:
	git clean -xdf

.PHONY:test
test:
	@rm -rf tests ~/.gnatstudio/templates/adapter/
	@mkdir -p tests
	install_template share/gnatstudio/templates/template/adapter.gpt
	gps  --pwd=tests
