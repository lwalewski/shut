BUNDLED = build/shut

all: $(BUNDLED)
	@echo "Successfully built $(BUNDLED)"

$(BUNDLED): test
	make -C build

test:
	make -C src $@

clean:
	make -C build $@
