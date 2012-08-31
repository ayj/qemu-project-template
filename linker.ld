/* TODO
 * - stack start and size
 * - rom and ram regions
 * - use section placement to put specific object files into rom and ram
 * 	(see http://www.math.utah.edu/docs/info/ld_3.html#SEC16)
 */

ENTRY(_start)

SECTIONS
{
	.text 0x10000 : 
	{ 
		*(.init.*) 
		*(.text) 
	}

	. = 0x8000000;
	.data	: { *(.data) } 
	.bss 	: { *(.bss) }
}

