#	makefile made by Mohammad Reza Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

#in order to use:
#change OUTPUT to the output name you want
#add directories that contain project sourcecode to SOURCE_DIRS
#you also can change compiler flags, add needed liberaries ... etc. if you need it
#this makefile will automatically find dependencies so you dont need to care about it

#project variables (its all you need to change)
OUTPUT := Baxayesh.out
SOURCE_DIRS := code 

#compiler variables
#compiler name
CXX :=g++
#compiler preprocess flags
CPPFLAGS =-MMD -MF $(DEPENDENCY_DIR)/$(basename $(@F)).d
#compilation flags
CXXFLAGS :=--std=c++11
#linker flags
LDFLAGS :=
#loud liberaries
LDLIBS :=

#makefile variables
#where to save build files (people usualy dont need to see these files)
BUILD_ROOT := .build
OBJECT_DIR := $(BUILD_ROOT)/objects
DEPENDENCY_DIR := $(BUILD_ROOT)/dependencies

sources := $(foreach dir, $(SOURCE_DIRS), $(wildcard $(dir)/*.cpp))
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

clean: cleandep cleanobj
	rm -df $(BUILD_ROOT)

cleanobj:
	rm -rf $(OBJECT_DIR) $(OUTPUT)

cleandep:
	rm -rf $(DEPENDENCY_DIR)

#includes
-include $(dependencies)