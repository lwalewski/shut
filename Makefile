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
