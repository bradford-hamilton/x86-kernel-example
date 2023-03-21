OUTPUT_FORMAT(elf32-i386)
ENTRY(start)                /* symbol name that should be the entry point of our executable */
SECTIONS                    /* define the layout of our executable */
{
  . = 0x100000;             /* "." represents the location counter - it's always initialized to 0x0 at beginning of the SECTIONS block, but we modify it */
  .text : { *(.text) }      /* "*" is a wildcard character that matches any file name. The expression *(.text) means all .text input sections from all input files. After linker places text output section, the value of the location counter becomes 0x1000000 + the size of the text output section. */
  .data : { *(.data) }      /* lc += .data */
  .bss  : { *(.bss) }       /* lc += .data */
}
