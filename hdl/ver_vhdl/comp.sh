#
ncvhdl -v93 test.vhd 
ncvlog bot.v
ncelab mid1 -access +rwc
ncsim mid1 -batch

