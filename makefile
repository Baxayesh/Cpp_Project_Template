#	makefile made by Mohammad Reza Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

CC = g++
CFLAGS = --std=c++11
LDFLAGS =
COMPILE = $(CC) $(CFLAGS)

TARGET = Baxayesh.out

SOURCES = $(wildcard code/*.cpp) 
#		  $(wildcard <directory name/*.cpp>
OBJECTS = $(SOURCES:.cpp=.o)


all: $(TARGET)

$(TARGET): $(OBJECTS) # and other object files
	$(COMPILE) $^ -o $@ $(LDFLAGS)

%.o: %.cpp
	$(COMPILE) -c $< -o $@


.PHONY: all run clean 

run: all
	./$(TARGET)

clean:
	@rm -rf code/*.o $(TARGET)
	@echo "cleaned up successfully"

