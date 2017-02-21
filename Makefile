CC = gcc
CFLAGS = -g -Wall -Os
LDFLAGS+= -s
CHMOD := $(shell which chmod)

USER := $(shell whoami)

all: mdns-repeater

mdns-repeater: mdns-repeater.o
	$(CC) $(CFLAGS) $^ -o $@

mdns-repeater.o: mdns-repeater.c
	$(CC) $(CFLAGS) -c mdns-repeater.c


install:
	@if [ $(USER) != "root" ]; then echo make install must be run as root.; false; fi
	$(CHMOD) 755 mdns-repeater
	mv mdns-repeater /usr/bin/mdns-repeater

clean:
		\/bin/rm -f *.o
