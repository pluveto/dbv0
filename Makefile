EXECUTABLE=main
BUILD_DIR=./build

CC=gcc
CFLAGS=-c -Wall -g
SOURCES=$(wildcard *.c)
OBJECTS=$(SOURCES:.c=.o)
OBJECTS:=$(addprefix $(BUILD_DIR)/, $(OBJECTS))

$(info $(OBJECTS))

default: all

build_dir:
	mkdir -p $(BUILD_DIR)

all: build_dir $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(BUILD_DIR)/$(EXECUTABLE)

$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) $< -o $(BUILD_DIR)/$*.o

clean:
	rm -rf $(BUILD_DIR)/*.o $(BUILD_DIR)/$(EXECUTABLE)
