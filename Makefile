CC=gcc
DEPS=bb_gpio.h
INSTALL_PREFIX:=/opt/j1708

all: ecm.c dpa.c
	$(CC) -pthread -o ecm -O4 ecm.c
	$(CC) -pthread -o dpa -O4 dpa.c 

clean:
	rm ecm
	rm dpa

install:
	if [ ! -e $(INSTALL_PREFIX)/bin ]; then mkdir -p $(INSTALL_PREFIX)/bin; fi
	cp ecm $(INSTALL_PREFIX)/bin
	cp dpa $(INSTALL_PREFIX)/bin
	python3 setup.py install


