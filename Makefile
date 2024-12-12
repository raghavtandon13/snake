# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Wall -Wextra -Werror
LDFLAGS = $(shell cat compile_flags.txt | grep -v -- '--target')
TARGET_FLAGS = $(shell cat compile_flags.txt | grep -- '--target')

# Directories
SRC_DIR = .
OBJ_DIR = build

# Files
SRC = $(SRC_DIR)/main.cpp
OBJ = $(OBJ_DIR)/main.o
OUT = a.exe

# Targets
all: $(OUT)

$(OUT): $(OBJ)
	$(CXX) $(OBJ) -o $(OUT) $(LDFLAGS)

$(OBJ): $(SRC)
	@mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -c $(SRC) -o $(OBJ)

clangd:
	@echo "Using clangd target flags: $(TARGET_FLAGS)"

clean:
	rm -rf $(OBJ_DIR) $(OUT)

.PHONY: all clean clangd
