# SHell Unit Test (SHUT) runner (https://github.com/lwalewski/shut.git)
# Copyright (c) 2017 Lukasz Walewski. All rights reserved.
# Distributed under the MIT License (http://opensource.org/licenses/MIT)

MAIN_FILE = ../src/shut
FUNC_FILE = ../src/functions
FUNC_REGEXP = \. \(.*\/\)*functions
CPYR_FILE = ../COPYING
DST_FILE = shut

all: $(DST_FILE)

$(DST_FILE): $(DST_FILE).tmp add_license add_functions
	mv $< $@

$(DST_FILE).tmp: $(MAIN_FILE)
	cp $< $@

add_license: $(DST_FILE).tmp license
	sed -i "5r $(word 2,$^)" $<

add_functions: $(DST_FILE).tmp
	sed -i -e "/$(FUNC_REGEXP)/r $(FUNC_FILE)" -e "/$(FUNC_REGEXP)/d" $<

license: $(CPYR_FILE)
	sed -e '1i #' -e 's/^/# /' $< > $@

.PHONY: add_functions add_license

.INTERMEDIATE: license

clean:
	rm -f $(DST_FILE)
