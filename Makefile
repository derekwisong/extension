
# Makefile to build an example q/kdb+ c extension

# bash$ make

CC=gcc

# get k.h from code.kx.com and place it in your $QHOME/include
CFLAGS=-I$(QHOME)/include -DKXVER=3

SOURCE=extension.c
SHARED_LIB=extension.so
BUILD_DIR=build

SHARED_LIB_FILE=$(BUILD_DIR)/$(SHARED_LIB)

default: $(SHARED_LIB_FILE)

$(BUILD_DIR):
	mkdir -p $@

$(SHARED_LIB_FILE): $(SOURCE) | $(BUILD_DIR)
	$(CC) $(CFLAGS) -shared -fPIC -m32 $(SOURCE) -o $@

clean:
	-rm $(SHARED_LIB_FILE)

nuke:
	-rm -rf $(BUILD_DIR)