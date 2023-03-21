;;kernel.asm

bits 32                 ;nasm directive - 32 bit - not assembly instruction
section .text
        ;multiboot spec for GRUB
        align 4                   ;word size 4 bytes
        dd 0x1BADB002             ;magic number to identify the header
        dd 0x00                   ;flags
        dd - (0x1BADB002 + 0x00)  ;checksum. m+f+c should be zero (when added to the fields ‘magic’ and ‘flags’ must give zero)

global start            ;nasm directive - set symbols from source code as global
extern kmain            ;kmain is defined elsewhere (in kernel.c file)

start:
  cli                   ;block interrupts (clear-interrupts)
  mov esp, stack_space  ;set stack pointer
  call kmain            ;call kmain c func
  hlt                   ;halt the cpu - interrupts can normally awake CPU from a hlt instruction

section .bss
resb 8192               ;8KB for stack - reserves memory given in bytes
stack_space:            ;label which will point to the edge of the reserved piece of memory
