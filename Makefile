GNU ?= g++
ARGS ?= -Wall -g
OPTIMIZATIONS ?= -O2

SRC = ./src
EXAMPLES = ./examples
TESTS =
# BIN = ./bin
LIB = ./lib

all : lib examples

lib :
	mkdir -p $(LIB)
	$(GNU) $(ARGS) $(OPTIMIZATIONS) -c $(SRC)/huffman.cpp -o $(LIB)/huffman.o
	$(GNU) $(ARGS) $(OPTIMIZATIONS) -c $(SRC)/libbrp.cpp -o $(LIB)/libbrp.o
	ar rcs $(LIB)/libbrp.a $(LIB)/huffman.o $(LIB)/libbrp.o
	$(GNU) $(ARGS) $(OPTIMIZATIONS) -shared -fPIC $(SRC)/huffman.cpp $(SRC)/libbrp.cpp -o $(LIB)/libbrp.so

examples : lib
# mkdir -p $(BIN)
# $(GNU) $(ARGS) $(OPTIMIZATIONS) $(EXAMPLES)/decompress.cpp $(SRC)/huffman.cpp $(SRC)/libbrp.cpp -o $(EXAMPLES)/decompress
	$(GNU) $(ARGS) $(OPTIMIZATIONS) $(EXAMPLES)/decompress.cpp $(LIB)/libbrp.a -o $(EXAMPLES)/decompress

clean :
	rm -f $(LIB)/huffman.o
	rm -f $(LIB)/decompress.o
	rm -f $(LIB)/libbrp.a
	rm -f $(LIB)/libbrp.so
	rm -rf $(LIB)
	rm -f $(EXAMPLES)/decompress
# rm -rf $(BIN)
