CC = g++ --std=c++11
FINAL_FILE = Baxayesh.out

HEADERS_ADDR = code/headers

#NEW_HEADER_H = $(HEADERS_ADDR)/new_header.hpp
#DIPENDENSIES = $(HEADER1) $(HEADER2)

run: $(FINAL_FILE)
	./$(FINAL_FILE)

$(FINAL_FILE): build/main.o #other object files
	$(CC) build/*.o -o $(FINAL_FILE)

build/main.o: code/main.cpp $(DIPENDENSIES)
	$(CC) -c code/main.cpp -o build/main.o


#here u must include other files in this format:
#build/x.o: code/x.cpp $(DIPENDENSIES) # u can use name of all of your dependent headers instead of $(DIPENDENSIES)
#	$(CC) -c code/x.cpp -o build/x.o

clean:
	rm -r build/*.o $(FINAL_FILE)

