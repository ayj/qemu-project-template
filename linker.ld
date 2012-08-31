/* TODO
 * - stack start and size
 * - rom and ram regions
 */

ENTRY(_start)

base_address_text = 0x10000;
base_address_data = 0x8000000;

SECTIONS
{
	. = 0x10000;
	.text 	: { *(.text) }
	. = 0x8000000;
	.data 	: { *(.data) }
	.bss	: { *(.bss) }
}

