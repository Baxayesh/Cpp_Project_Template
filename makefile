#	makefile template made by M. R. Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

##############################################################
##			 all you need to change is this	part			##
##############################################################

#project variables 
APP_NAME := foobar
OUTPUT_DIR := .
SOURCE_DIRS := code

#compiler variables
#compiler name
CXX :=g++
#compiler preprocess flags
CPPFLAGS :=
#compilation flags
CXXFLAGS :=--std=c++11
#linker flags
LDFLAGS :=
#loud liberaries
LDLIBS :=

##############################################################
##		 You don't need to make any change on the rest		##
##############################################################

#makefile variables 
BUILD_ROOT := .build
OBJECT_DIR := $(BUILD_ROOT)/objects
DEPENDENCY_DIR := $(BUILD_ROOT)/dependencies

sources := $(foreach dir, $(SOURCE_DIRS), $(wildcard $(dir)/*.cpp))
objects := $(addprefix $(OBJECT_DIR)/, $(sources:.cpp=.o))
dependencies := $(addprefix $(DEPENDENCY_DIR)/, $(sources:.cpp=.d))

#auto dependency detection tags for compiler
CPPFLAGS = $(auto_dep_tag)

#compile rules
.DEFAULT_GOAL: all

EXECUTABLE :=$(OUTPUT_DIR)/$(APP_NAME)

all: $(EXECUTABLE)

$(EXECUTABLE): $(objects)
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@ 

$(OBJECT_DIR)/%.o: %.cpp
	@mkdir -p $(@D) $(get_dep_adderss)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@ 

#instalation phonies
.PHONY: install uninstall

PREFIX :=/usr/local

install: $(EXECUTABLE)
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $< $(DESTDIR)$(PREFIX)/bin/$(APP_NAME)
	@echo program installed successfully

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(APP_NAME)
	@echo program uninstalled successfully

#other phonies
.PHONY: run clean cleanobj cleandep

run: all
	$(EXECUTABLE)

clean: cleandep cleanobj
	rm -df $(BUILD_ROOT)

cleanobj:
	rm -rf $(OBJECT_DIR) $(EXECUTABLE)

cleandep:
	rm -rf $(DEPENDENCY_DIR)


#includes
-include $(dependencies)

#macroes
get_dep_adderss = $(subst $(OBJECT_DIR), $(DEPENDENCY_DIR), $(@D))
auto_dep_tag = -MMD -MF $(get_dep_adderss)/$(basename $(@F)).d