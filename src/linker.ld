/* TODO
 * - stack start and size
 * - rom and ram regions
 * - use section placement to put specific object files into rom and ram
 * 	(see http://www.math.utah.edu/docs/info/ld_3.html#SEC16)
 */

ENTRY(_start)

SECTIONS
{
	. = 0x10000; 
	.text 	: { 
		*(._start)
		*(.text) 
	}
	.data	: { *(.data) } 
	.bss 	: { *(.bss) }

 	/* 4k of stack memory */
	. = ALIGN(8);
	. = . + 0x1000;
	stack_top = .;
}

