# SHell Unit Test (SHUT) runner (https://github.com/lwalewski/shut.git)
# Copyright (c) 2017 Lukasz Walewski. All rights reserved.
# Distributed under the MIT License (http://opensource.org/licenses/MIT)

STANDALONE = build/shut

all: $(STANDALONE)
	@echo "Successfully tested and built standalone version in: $(STANDALONE)"
	@echo "You can copy it to your project now!"

$(STANDALONE): test
	make -C build

test:
	make -C src $@

clean:
	make -C build $@
