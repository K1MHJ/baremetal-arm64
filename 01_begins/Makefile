CROSS_PREFIX=aarch64-none-elf-
MAKEFILE_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
BIN_DIR=$(MAKEFILE_DIR)../bin/
OBJ_DIR=$(MAKEFILE_DIR)obj/
SRC_DIR=$(MAKEFILE_DIR)
CFLAGS = -Wall -O2 -ffreestanding -nostdinc -nostdlib -nostartfiles
LDFLAGS = -nostdlib

all: $(BIN_DIR)boot.bin

$(OBJ_DIR)kernel.o: $(SRC_DIR)kernel.c
	mkdir -p $(@D)
	$(CROSS_PREFIX)gcc $(CFLAGS) -mcpu=cortex-a53 -DUART0_PTR=0x09000000 -c $< -o $@

$(OBJ_DIR)startup.o: $(SRC_DIR)startup.s
	mkdir -p $(@D)
	$(CROSS_PREFIX)as -mcpu=cortex-a53 -c $< -o $@

$(BIN_DIR)boot.elf: $(OBJ_DIR)startup.o $(OBJ_DIR)kernel.o
	mkdir -p $(@D)
	$(CROSS_PREFIX)ld -T $(SRC_DIR)linker.ld $(LDFLAGS) -defsym START=0x80000 -o $@ $^

$(BIN_DIR)boot.bin: $(BIN_DIR)boot.elf
	$(CROSS_PREFIX)objcopy -O binary $< $@

clean:
	rm -Rf $(BIN_DIR)* $(OBJ_DIR) >/dev/null 2>/dev/null || true

run:
	bash $(MAKEFILE_DIR)../run-qemu.sh
