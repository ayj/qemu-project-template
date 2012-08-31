/* TODO
 * - stack start and size
 * - rom and ram regions
 * - use section placement to put specific object files into rom and ram
 * 	(see http://www.math.utah.edu/docs/info/ld_3.html#SEC16)
 */

ENTRY(_start)

/* define base address outside of section for easier readability */
base_address_text = 0x10000;
base_address_data = 0x8000000;

SECTIONS
{
	.text base_address_text : 
	{ 
		*(.text) 
	}

	.data base_address_data : 
	{ 
		*(.data) 
	}

	.bss :
	{ 
		*(.bss) 
	}
}

