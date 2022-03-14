#	makefile made by Mohammad Reza Baxayesh
#	contact me: m.r.Bakhshayesh1123@gmail.com

CC = g++ 
CFLAGS = --std=c++11
COMPILE = $(CC) $(CFLAGS)

TARGET = Baxayesh.out


HEADERS_ADDR = code/headers
BUILD = build 

DEPENDENCY_H = $(HEADERS_ADDR)/dependency.hpp
EXAMPE_H = $(HEADERS_ADDR)/example.hpp

DIPENDENCIES = $(DEPENDENCY_H) $(EXAMPE_H) #and other headers

.PHONY: run clean 

all: $(BUILD) $(TARGET)

$(TARGET): $(BUILD)/main.o $(BUILD)/example.o # and other object files
	$(COMPILE) $^ -o $@

$(BUILD)/main.o: code/main.cpp $(DIPENDENSIES)
	$(COMPILE) -c $< -o $@

$(BUILD)/example.o: code/example.cpp $(DIPENDENSIES) #or $(EXAMPE_H) $(DEPENDENCY_H)
	$(COMPILE) -c $< -o $@


#here u must include other files in this format:
#$(BUILD)/x.o: code/x.cpp $(DIPENDENSIES) # u can name of all of your dependent headers instead of using $(DIPENDENSIES)
#	$(COMPILE) -c $< -o $@


$(BUILD):
	@mkdir -p $@

run: all
	./$(TARGET)

clean:
	@rm -rf $(BUILD)/*.o $(TARGET)
	@echo "cleaned up successfully"

