MAKEFLAGS = --no-print-directory

CROSS_COMPILE = arm-linux-gnueabi-
CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)ld
NM = $(CROSS_COMPILE)nm
AS = $(CROSS_COMPILE)as
OBJCOPY = $(CROSS_COMPILE)objcopy

SRCDIR	= src
OBJS    = $(patsubst %.c, %.o, $(wildcard $(SRCDIR)/*.c))
OBJS   += $(patsubst %.s, %.o, $(wildcard $(SRCDIR)/*.s))
DEPS	= $(wildcard $(SRCDIR)/*.d)

PROGNAME = main

CFLAGS = -Os -g -Wall -nostdlib -I$(SRCDIR) -MMD
LDFLAGS = -T linker.ld

ifeq ($(V),1)
	Q=
	NQ=true
else
	Q=@
	NQ=echo
endif

%.o: %.c
	@$(NQ) ' CC  ' $@
	$(Q)$(CC) $(CFLAGS) -c -o $@ $<

%.o: %.s
	@$(NQ) ' AS  ' $@
	$(Q)$(AS) -o $@ $<

all: $(PROGNAME).bin

$(PROGNAME).elf: $(OBJS) 
	@$(NQ) ' LD  ' $(PROGNAME).elf
	$(Q)$(LD) $(LDFLAGS) $(OBJS) -o $(PROGNAME).elf

$(PROGNAME).bin: $(PROGNAME).elf
	@$(NQ) ' BIN ' $(PROGNAME).bin
	$(Q)$(OBJCOPY) -O binary $(PROGNAME).elf $(PROGNAME).bin

check:
	$(Q)$(MAKE) all CC="REAL_CC=$(CC) CHECK=\"sparse -Wall\" cgcc"

nm:
	$(Q)$(NM) -n -S main

clean:
	rm -f $(SRCDIR)/*.o $(SRCDIR)/*.d *.elf *.bin

.PHONY: all check nm clean

-include $(OBJS:%.o=%.d)
