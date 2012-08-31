.global _start
.section _start_section

_start:
	ldr sp, =stack_top
	bl _main
	b .
