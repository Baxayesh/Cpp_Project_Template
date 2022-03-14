#	made by Mohammad Reza Baxayesh
#	m.r.Bakhshayesh1123@gmail.com

CC = g++ 
CFLAGS = --std=c++11
COMPILE = $(CC) $(CFLAGS)

TARGET = Baxayesh.out

HEADERS_ADDR = code/headers
#determining name of folder to store .o files
BUILD = build 

DEPENDENCY_H = $(HEADERS_ADDR)/dependency.hpp
EXAMPE_H = $(HEADERS_ADDR)/example.hpp

DIPENDENCIES = $(DEPENDENCY_H) $(EXAMPE_H) #and other headers

.PHONY: run clean 
.DEFAULT_GOAL := $(TARGET)

run: $(TARGET)
	./$(TARGET)

$(TARGET): $(BUILD) $(BUILD)/main.o $(BUILD)/example.o # and other object files
	$(COMPILE) $(BUILD)/*.o -o $(TARGET)

$(BUILD)/main.o: code/main.cpp $(DIPENDENSIES)
	$(COMPILE) -c code/main.cpp -o $(BUILD)/main.o


$(BUILD)/example.o: code/example.cpp $(DIPENDENSIES) #or $(EXAMPE_H) $(DEPENDENCY_H)
	$(COMPILE) -c code/example.cpp -o $(BUILD)/example.o


#here u must include other files in this format:
#$(BUILD)/x.o: code/x.cpp $(DIPENDENSIES) # u can name of all of your dependent headers instead of using $(DIPENDENSIES)
#	$(COMPILE) -c code/x.cpp -o $(BUILD)/x.o


$(BUILD):
	@mkdir -p $@

clean:
	@rm -r $(BUILD)/*.o $(TARGET)
	@echo "cleaned up successfully"

