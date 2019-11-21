all:install

install:
	git clean . -xdf
	cd template; find . -type f | grep -v adapter.gpt >${CURDIR}/_temp
	tar -cf ${CURDIR}/_dummy.tar -C template            --files-from=${CURDIR}/_temp
	tar -xf ${CURDIR}/_dummy.tar -C templateTemplate
	sed -e "s/.*@SKIP-INSTALL//"  -i `find templateTemplate -type f`

