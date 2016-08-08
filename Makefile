all: hissh
CC=gcc
CXX=g++
CFLAGS=-O2 -Wall -Wno-trigraphs 
LDFLAGS=
LIBS=-lutil
LIBTERMCAP=-lncurses
USE_GLIBC=1

CFLAGS += '-DISSUE_FILE="/etc/issue.net"' -DPARANOID_TTYS \
	   -DNO_REVOKE \
	   -DLOGIN_WRAPPER=\"/bin/sh\" \
	   -D_GNU_SOURCE

OBJS = telnetd.o state.o termstat.o sys_term.o utility.o \
	global.o


hissh: $(OBJS)
	$(CC) -g $(LDFLAGS) $^ $(LIBS) -o $@

$(OBJS): defs.h ext.h telnetd.h

clean:
	rm -f *.o hissh
