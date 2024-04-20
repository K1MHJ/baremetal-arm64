MAKEFILE_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BIN_DIR=$(MAKEFILE_DIR)bin/

all:
	cd ./01_begins && make

clean:
	rm -Rf $(BIN_DIR) >/dev/null 2>/dev/null || true

run:
	bash $(MAKEFILE_DIR)run-qemu.sh
