#	makefile made by Mohammad Reza Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

#Warning: using file or directory names that contain spaces may cuase some problem

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
CPPFLAGS =$(auto_dep_tag)
#compilation flags
CXXFLAGS :=--std=c++11
#linker flags
LDFLAGS :=
#loud liberaries
LDLIBS :=

#makefile variables (you wont need to change the rest of makefile)
#where to save build files (people usualy dont need to see these files)
BUILD_ROOT := .build
OBJECT_DIR := $(BUILD_ROOT)/objects
DEPENDENCY_DIR := $(BUILD_ROOT)/dependencies

sources := $(foreach dir, $(SOURCE_DIRS), $(wildcard $(dir)/*.cpp))
objects := $(addprefix $(OBJECT_DIR)/, $(sources:.cpp=.o))
dependencies := $(addprefix $(DEPENDENCY_DIR)/, $(sources:.cpp=.d))

#compile rules
.DEFAULT_GOAL: all

all: $(OUTPUT)

$(OUTPUT): $(objects)
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@ 

$(OBJECT_DIR)/%.o: %.cpp
	@mkdir -p $(@D)
	@mkdir -p $(get_dep_adderss)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@ 

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

#macroes
get_dep_adderss = $(subst $(OBJECT_DIR), $(DEPENDENCY_DIR), $(@D))
auto_dep_tag = -MMD -MF $(get_dep_adderss)/$(basename $(@F)).d