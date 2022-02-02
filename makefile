#	made by Mohammad Reza Baxayesh
#	m.r.Bakhshayesh1123@gmail.com

CC = g++ --std=c++11
FINAL_FILE = Baxayesh.out

HEADERS_ADDR = code/headers

DEPENDENCY_H = $(HEADERS_ADDR)/dependency.hpp
EXAMPE_H = $(HEADERS_ADDR)/example.hpp

DIPENDENCIES = $(DEPENDENCY_H) $(EXAMPE_H)

run: $(FINAL_FILE)
	./$(FINAL_FILE)

$(FINAL_FILE): build/main.o example.o # and other object files
	$(CC) build/*.o -o $(FINAL_FILE)

build/main.o: code/main.cpp $(DIPENDENSIES)
	$(CC) -c code/main.cpp -o build/main.o


build/example.o: code/example.cpp $(DIPENDENSIES) #or $(EXAMPE_H) $(DEPENDENCY_H)
	$(CC) -c code/example.cpp -o build/example.o

#here u must include other files in this format:
#build/x.o: code/x.cpp $(DIPENDENSIES) # u can name of all of your dependent headers instead of using $(DIPENDENSIES)
#	$(CC) -c code/x.cpp -o build/x.o

clean:
	rm -r build/*.o $(FINAL_FILE)

