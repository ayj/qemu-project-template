define t_src_regs
	layout src
	layout regs
end

define t_asm_regs
	layout asm
	layout regs
end

target remote localhost:2345
add-symbol-file main.elf 0x10000
 
