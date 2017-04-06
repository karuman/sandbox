LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use std.TEXTIO.all;

entity mid1 is
end mid1;

architecture a_mid1 of mid1 is

component bot is
port (bot_p1 : in std_ulogic);
end component;

signal p1 : std_ulogic_vector(7 downto 0);
signal p2 : std_ulogic;

function user_defined_function ( r : std_ulogic_vector (7 downto 0) ) return std_ulogic is
begin
return '1';
end user_defined_function;

begin
p1 <= X"ff" ;
--bot_inst : bot port map (bot_p1 => user_defined_function (p1));
p2 <= user_defined_function (p1);
bot_inst : bot port map (bot_p1 => p2);

end a_mid1;
