all:clean compile test

compile:
	gprbuild -p -P  project_name-tests.gpr

test:compile
	mkdir -p results
	bin/project_name-tests | tee results/test-results.xml
	diff -r golden results
	
clean:
	git clean -xdf .
