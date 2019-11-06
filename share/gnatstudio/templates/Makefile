all:
	cd template; find . -type f | grep -v adapter.gpt >${CURDIR}/_temp
	(tar -C template -c $(shell cat ${CURDIR}/_temp)) | (cd templateTemplate; tar -x)
