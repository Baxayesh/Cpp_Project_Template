#	makefile made by Mohammad Reza Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

#in order to use you just need to add your source code 
#(or sourcecoe directories) to Source variables
# for example
#SOURCE += x.cpp or SOURCE += $(wildcard dir/*.cpp)

#next change clue:
#(i should manage program to store .d and .o files in a diferent folder)
#https://stackoverflow.com/questions/25966411/autodependencies-for-make-generate-the-d-files-but-are-not-reading-them

CC = g++
CFLAGS = --std=c++11 -MMD
LDFLAGS =
COMPILE = $(CC) $(CFLAGS)

TARGET = Baxayesh.out
SOURCES = $(wildcard code/*.cpp)
OBJECTS = $(SOURCES:.cpp=.o)
DEPENDENCIES = $(OBJECTS:.o=.d)

.DEFAULT_GOAL: all
.PHONY: run clean cleandep

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(COMPILE) $^ -o $@ $(LDFLAGS)

-include $(DEPENDENCIES)

%.o: %.cpp
	$(COMPILE) -c $< -o $@

run: all
	./$(TARGET)

clean:
	rm -f $(OBJECTS) $(TARGET)

cleandep:
	rm -f $(DEPENDENCIES)