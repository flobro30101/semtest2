all: main

semtest.o: semtest.cpp
	gcc -g -c -fPIC -m32 semtest.cpp -o semtest.o

libsemtest.so: semtest.o
	gcc -g -shared -m32 -fPIC  semtest.o -Wl,-soname,libsemtest.so.0 -o libsemtest.so.0.0 -pthread -lrt -lc
	/sbin/ldconfig -n .
	ln -s libsemtest.so.0 libsemtest.so

main: libsemtest.so
	gcc -g -m32  main.cpp -o semtest  -L$(CURDIR) -lsemtest -lc -lpthread -lrt

clean:
	rm semtest.o libsemtest.so* semtest