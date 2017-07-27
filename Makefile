all: main

semtest.o: semtest.cpp
	gcc -g -c -fPIC -m32 semtest.cpp -o semtest.o

libsemtest.so: semtest.o
	gcc -g -shared -m32 -fPIC  semtest.o -Wl,-soname,libsemtest.so.0 -o libsemtest.so.0.0 -pthread -lrt -lc
	/sbin/ldconfig -n .
	ln -s libsemtest.so.0 libsemtest.so

main: libsemtest.so
	gcc -g -m32  main.cpp -o semtest  -L/media/flobro/a125ac59-de36-45eb-a83f-3eae68f38465/home/ectrs/emerson/semtest2 -lsemtest -lc -lpthread -lrt

clean:
	rm semtest.o libsemtest.so* semtest