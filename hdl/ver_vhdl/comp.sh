#
ncvhdl -v93 test.vhd 
ncvlog bot.v
ncelab mid1 -access +rwc -gpg "mid1.bot_inst.PullTime=>102"

ncsim mid1 -batch

