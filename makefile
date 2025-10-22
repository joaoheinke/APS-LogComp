CXX := g++
CXXFLAGS := -O2 -Wall -Wextra -std=c++17 -Ibuild

SRC := src
BUILD := build

LEX := $(BUILD)/futlang.lex.cpp
YACC := $(BUILD)/futlang.tab.cpp
BIN := $(BUILD)/futlang

all: $(BIN)

$(BUILD):
	mkdir -p $(BUILD)

$(YACC): | $(BUILD)
	bison -d -o $(YACC) $(SRC)/futlang.y

$(LEX): $(YACC)
	flex -o $(LEX) $(SRC)/futlang.l

$(BIN): $(YACC) $(LEX) $(SRC)/main.cpp
	$(CXX) $(CXXFLAGS) $(YACC) $(LEX) $(SRC)/main.cpp -o $(BIN)

clean:
	rm -rf $(BUILD)

.PHONY: all clean
