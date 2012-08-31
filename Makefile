MAKEFLAGS = --no-print-directory

CC = arm-linux-gnueabi-gcc
LD = arm-linux-gnueabi-ld
NM = arm-linux-gnueabi-nm
QEMU = qemu-arm

CFLAGS = -Os -g -Wall -nostdlib -I. -MMD
LDFLAGS = -T linker.ld

OBJDIR	= .
SRCS    = $(wildcard *.c)
OBJS    = $(patsubst %.c,$(OBJDIR)/%.o,$(SRCS))
DEPS	= $(wildcard *.d)

ifeq ($(V),1)
	Q=
	NQ=true
else
	Q=@
	NQ=echo
endif

$(OBJDIR)/%.o:   %.c
	@$(NQ) ' CC  ' $@
	$(Q)$(CC) $(CFLAGS) -c -o $@ $<

all:	$(OBJS) 
	@$(NQ) ' LD  ' main
	$(Q)$(LD) $(LDFLAGS) $(OBJS) -o main

check:
	$(Q)$(MAKE) all CC="REAL_CC=$(CC) CHECK=\"sparse -Wall\" cgcc"

nm:
	$(Q)$(NM) -n -S main

clean:
	rm -f $(OBJDIR)/*.o *.d main 

run:
	$(QEMU) main

.PHONY: all check nm clean

-include $(OBJS:%.o=%.d)
