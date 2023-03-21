Going through [writing a simple x86 kernel](https://arjunsreedharan.org/post/82710718100/kernels-101-lets-write-a-kernel)

---

Better off building/running this on a linux machine, but here are the mac deps:

```
brew tap nativeos/i386-elf-toolchain
brew install nativeos/i386-elf-toolchain/i386-elf-binutils
brew install nativeos/i386-elf-toolchain/i386-elf-gcc
```

Unfortunately won't work with m1 mac currently:
https://github.com/nativeos/homebrew-i386-elf-toolchain/issues/23

---

**Building the kernel:**

Run assembler to create the object file kasm.o in ELF-32 bit format:
```
nasm -f elf32 src/kernel.asm -o kasm.o
```

GCC compile without implicit linking:
```
i386-elf-gcc -m32 -c src/kernel.c -o kc.o
```

Run the linker with linker script and generate the executable named kernel:
```
i386-elf-ld -m elf_i386 -T src/link.ld -o kernel kasm.o kc.o
```

Run the kernel on the qemu emulator instead of booting with GRUB
```
qemu-system-i386 -kernel kernel
```
