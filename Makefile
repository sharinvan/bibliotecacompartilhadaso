all: install
obj:
	gcc	-c	sub.c	-fPIC
	gcc	-c	soma.c	-fPIC
	gcc	-c	div.c	-fPIC
	gcc	-c	mult.c	-fPIC
	mkdir	obj
	cp	sub.o	obj
	cp	soma.o	obj
	cp	div.o	obj
	cp	mult.o	obj
	rm	-f	sub.o
	rm	-f	soma.o
	rm	-f	div.o
	rm	-f	mult.o

estatico:	obj
	ar	-crs	obj/liboperacoes.a	obj/soma.o	obj/sub.o	obj/mult.o	obj/div.o

dinamico:	obj
	gcc	-shared	-o	obj/liboperacoes.so.1	obj/soma.o	obj/sub.o	obj/mult.o	obj/div.o
	ln	-s	liboperacoes.so.1	obj/liboperacoes.so

install:	dinamico
	sudo	cp	obj/liboperacoes.so.1	/usr/lib
	sudo	cp	obj/liboperacoes.so	/usr/lib
	sudo	cp	operacoes.h	/usr/include

clean:
	rm	-rf	obj
