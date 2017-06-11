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

version_file = src/shut

release: tag

tag: commit
	git tag -a "v$(new_vstr)"

commit: version
	git commit -m "release version $(new_vstr)" $(version_file)

version: new_version
	sed -i '/^VERSION=/s/.*/VERSION=\x27$(new_vstr)\x27/' $(version_file)

new_version: old_version
	$(eval new_vstr := $(shell ./scripts/get-new-version.sh -c "$(old_vstr)"))

old_version:
	$(eval old_vstr := $(shell ./scripts/get-old-version.sh))

