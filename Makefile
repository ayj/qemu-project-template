MAKEFLAGS = --no-print-directory

CC = arm-linux-gnueabi-gcc
LD = arm-linux-gnueabi-ld
QEMU = qemu-arm

CFLAGS = -Os -g -Wall -nostdlib
LDFLAGS = -T linker.ld

OBJS = main.o

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
	@$(NQ) ' LD  ' main
	$(Q)$(LD) $(LDFLAGS) $(OBJS) -o main

check:
	$(Q)$(MAKE) all CC="REAL_CC=$(CC) CHECK=\"sparse -Wall\" cgcc"

clean:
	rm -f *.o main

run:
	$(QEMU) main
