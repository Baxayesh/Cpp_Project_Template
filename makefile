#	makefile made by Mohammad Reza Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

#in order to use you just need to add your source code 
#(or sourcecoe directories) to Source variables
# for example
#SOURCE += x.cpp or SOURCE += $(wildcard dir/*.cpp)

#next change clue:
#(i should manage program to store .d and .o files in a diferent folder)
#https://stackoverflow.com/questions/25966411/autodependencies-for-make-generate-the-d-files-but-are-not-reading-them


#project variables
OUTPUT := Baxayesh.out
SOURCE_DIRS := 
HEADER_DIRS:=
OBJECT_DIR := .build/objects
DEPENDENCY_DIR := .build/dependencies


#makefile variables
CXX := g++
CPPFLAGS = -MMD -MF $(DEPENDENCY_DIR)/$(basename $(@F)).d
CXXFLAGS := --std=c++11 
LDFLAGS :=
LDLIBS :=

sources := $(wildcard code/*.cpp)
objects := $(addprefix $(OBJECT_DIR)/, $(sources:.cpp=.o))
dependencies := $(addprefix $(DEPENDENCY_DIR)/, $(notdir $(objects:.o=.d)))

#compile rules
.DEFAULT_GOAL: all

all: $(DEPENDENCY_DIR) $(OUTPUT)

$(OUTPUT): $(objects)
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@ 

$(OBJECT_DIR)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@ 

#non-compile rules
$(DEPENDENCY_DIR):
	@mkdir -p $@

#phonies
.PHONY: run clean cleanobj cleandep

run: all
	./$(OUTPUT)

clean: cleanobj cleandep

cleanobj:
	rm -rf $(objects) $(OUTPUT)

cleandep:
	rm -rf $(dependencies)

#includes
-include $(dependencies)