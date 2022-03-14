#	makefile made by Mohammad Reza Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

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