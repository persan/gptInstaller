all:install

install:
	git clean . -xdf
	cd template; find . -type f | grep -v adapter.gpt >${CURDIR}/_temp
	@(tar -C template -c $(shell cat ${CURDIR}/_temp)) | (cd templateTemplate; tar -x)
	sed -e "s/.*@SKIP-INSTALL//"  -i `find templateTemplate -type f`

