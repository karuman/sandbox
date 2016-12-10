#
gcc  -c -g  -fPIC -m32 -I$MTI_DIR/include  my_pli.c 
gcc -m32 -shared -Bsymbolic -L$MTI_DIR/linuxaloem -lmtipli -o my_pli.sl my_pli.o

vlib work

vlog test_module.v 

vsim test_module -pli my_pli.sl -batch

