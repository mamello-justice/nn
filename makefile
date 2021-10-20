PROJECT_NAME = NeuralNetworks
PROGRAM = nn

CC = g++
CFLAGS = -Wall -std=c++11

BIN = bin
INC = -Iinclude
LIBS = 
OBJ = obj
SRC = src

$(BIN)/$(PROGRAM): $(OBJ)/driver.o $(OBJ)/utils.o
	$(CC) $(CFLAGS) $(INC) $^ -o $@ $(LIBS)

$(OBJ)/%.o: $(SRC)/%.cpp
	$(CC) $(CFLAGS) $(INC) -c $< -o $@ $(LIBS)

clean:
	@rm bin/database lib/*.so obj/*.o

install:
	@sudo mkdir /opt/$(PROJECT_NAME) 
	@sudo mv * /opt/$(PROJECT_NAME)/
	@chmod -R 700 /opt/$(PROJECT_NAME)/bin/$(PROGRAM)
	@export LD_LIBRARY_PATH=lib/

run:
	@export LD_LIBRARY_PATH=lib/
	@./bin/$(PROGRAM)
