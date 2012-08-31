CC = arm-linux-gnueabi-gcc
LD =  rm-linux-gnueabi-ld

CFLAGS = -Os -g -Wall -nostdlib
LDFLAGS = 

OBJS = main.o
LIBs =

ifeq ($(V),1)
	Q=
	NQ=true
else
	Q=@
	NQ=echo
endif

%.o:	%.c 
	@$(NQ) ' CC  ' $@
	$(Q)$(CC) $(CFLAGS) -c -o $@ $<

all:	$(OBJS)
	@$(NQ) ' CC  ' main
	$(Q)$(CC) $(LDFLAGS) $(OBJS) $(LIBS) -o main

check:
	$(Q)$(MAKE) all CC="REAL_CC=$(CC) CHECK=\"sparse -Wall\" cgcc"

clean:
	rm -f *.o main
