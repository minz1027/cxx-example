.PHONY: cleanplatforms platforms testcoverageplatforms sonarcoverage

.DEFAULT_GOAL := testcoverageplatforms

cleanplatforms:
	-rm -rf build

build/CMakeCache.txt: CMakeLists.txt
	mkdir $(@D); cd $(@D); cmake3 ..

platforms: build/CMakeCache.txt
	$(MAKE) -C build

testcoverageplatforms: build/CMakeCache.txt platforms
	$(MAKE) -C build test

sonarcoverage:
	gcovr -x -r . > build/gcovr-report.xml