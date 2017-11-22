.PHONY:test_config
INCLUDE=../phxrpc/file
CFLAGS= -std=c++11 -Wall -D_REENTRANT -D_GNU_SOURCE -D_XOPEN_SOURCE -fPIC -m64 -g
SRC=$(INCLUDE)/file_utils.cpp $(INCLUDE)/config.cpp $(INCLUDE)/log_utils.cpp $(INCLUDE)/opt_map.cpp
OBJ=$(patsubst %.cpp,%.o,$(SRC))

%.o:%.cpp
	g++ -c $< -I $(INCLUDE) $(CFLAGS) -o $@

test_config:$(OBJ) test_config.o
#	g++ -c $(INCLUDE)/file_utils.cpp -I $(INCLUDE) $(CFLAGS) -o $(INCLUDE)/file_utils.o
#	g++ -c $(INCLUDE)/config.cpp -I $(INCLUDE) $(CFLAGS) -o $(INCLUDE)/config.o
#	g++ -c test_config.cpp -I $(INCLUDE) $(CFLAGS) 
	g++ $(SRC) test_config.cpp -o test_config -I $(INCLUDE) $(CFLAGS)
test_fileutils:$(OBJ) test_fileutils.o
	g++ $(SRC) test_fileutils.cpp -o test_fileutils -I $(INCLUDE) $(CFLAGS)
test_optmap:$(OBJ) test_optmap.o
	g++ $(SRC) test_optmap.cpp -o test_optmap -I $(INCLUDE) $(CFLAGS)
see:
	echo $(SRC)
	echo $(OBJ)
clean:
	rm -rf $(OBJ)
	rm -rf test_config test_config.o
	rm -rf test_fileutils test_fileutils.o
	rm -rf test_optmap test_optmap.o
