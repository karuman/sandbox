#!/bin/csh -f
#
#
# sudo apt-get install lsb
# sudo apt-get install libc6-dev-i386
# これはいらないかも sudo apt-get install ia32-libs lib32gcc1 lib32stdc++6 libc6-dev-i386 gcc-multilib



gcc -c -fPIC -m32  vpm-sim.c

gcc -c -g  -fPIC -m32 -I$MTI_DIR/include ialu_emu.c 
#ld -m32 -shared -E -o ialu_emu.sl ialu_emu.o vpm-sim.o
gcc -m32 -shared -o  ialu_emu.sl ialu_emu.o vpm-sim.o



gcc -c -g  -fPIC -m32 -I$MTI_DIR/include fadd_emu.c 
#ld -m32 -shared -E -o fadd_emu.sl fadd_emu.o vpm-sim.o
gcc -m32 -shared -o  fadd_emu.sl fadd_emu.o vpm-sim.o

gcc -c -g  -fPIC -m32 -I$MTI_DIR/include fmul_emu.c 
#ld -m32 -shared -E -o fmul_emu.sl fmul_emu.o vpm-sim.o
gcc -m32 -shared -o  fmul_emu.sl fmul_emu.o vpm-sim.o

cp -f  *.sl  ../../sim

