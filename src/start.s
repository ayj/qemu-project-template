.section ._start, "x"
.global _start

_start:
	ldr sp, =stack_top
	bl _main
	b .
