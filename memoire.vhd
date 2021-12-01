LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------

-- Port lecture

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity lecture is
    port(
        address, read_in : in std_logic_vector(31 downto 0);
        read_out : out std_logic_vector(31 downto 0);
        ReadMem_W, ReadMem_SH, ReadMem_UH, ReadMem_SB, ReadMem_UB : in std_logic
    );
end entity;

architecture arch_lecture of lecture is
    signal demi0, demi1, octet0, octet1, octet2, octet3 : std_logic_vector(31 downto 0);
begin
    demi0(15 downto 0) <= read_in(15 downto 0);
    demi1(15 downto 0) <= read_in(31 downto 16);
    octet0(7 downto 0) <= read_in(7 downto 0);
    octet1(7 downto 0) <= read_in(15 downto 8);
    octet2(7 downto 0) <= read_in(23 downto 16);
    octet3(7 downto 0) <= read_in(31 downto 24);

    demi0(31 downto 16) <= (others=>'0') when ReadMem_UH = '1' or (ReadMem_SH = '1' and read_in(15) = '0') else
                           (others=>'1') when ReadMem_SH = '1' and read_in(15) = '1';

    demi1(31 downto 16) <= (others=>'0') when ReadMem_UH = '1' or (ReadMem_SH = '1' and read_in(31) = '0') else
                           (others=>'1') when ReadMem_SH = '1' and read_in(31) = '1';

    octet0(31 downto 8) <= (others=>'0') when ReadMem_UB ='1' or (ReadMem_SB = '1' and read_in(7) = '0') else
                           (others=>'1') when ReadMem_SB = '1' and read_in(7) = '1';
                           
    octet1(31 downto 8) <= (others=>'0') when ReadMem_UB ='1' or (ReadMem_SB = '1' and read_in(15) = '0') else
                           (others=>'1') when ReadMem_SB = '1' and read_in(15) = '1';

    octet2(31 downto 8) <= (others=>'0') when ReadMem_UB ='1' or (ReadMem_SB = '1' and read_in(23) = '0') else
                           (others=>'1') when ReadMem_SB = '1' and read_in(23) = '1';
    
    octet3(31 downto 8) <= (others=>'0') when ReadMem_UB ='1' or (ReadMem_SB = '1' and read_in(31) = '0') else
                           (others=>'1') when ReadMem_SB = '1' and read_in(31) = '1';


    read_out <= read_in when ReadMem_W ='1' else
                demi0 when address(1) = '0' and  (ReadMem_SH ='1' or ReadMem_UH ='1') else
                demi1 when address(1) = '1' and  (ReadMem_SH ='1' or ReadMem_UH ='1') else
                octet0 when address(1 downto 0) = "00" and (ReadMem_SB = '1' or ReadMem_UB = '1') else
                octet1 when address(1 downto 0) = "01" and (ReadMem_SB = '1' or ReadMem_UB = '1') else
                octet2 when address(1 downto 0) = "10" and (ReadMem_SB = '1' or ReadMem_UB = '1') else
                octet3 when address(1 downto 0) = "11" and (ReadMem_SB = '1' or ReadMem_UB = '1'); 
                        
end arch_lecture;



----------------------------------------------

-- Port ecriture

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity ecriture is
    port(
    address, data_in, current_mem : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0);
    WriteMem_W,WriteMem_H,WriteMem_B : in std_logic
    );
  
end entity;

architecture arch_ecriture of ecriture is
begin

end arch_ecriture;



----------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

----------------------------------------------

-- Memoire

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity memoire is
    port(
    address, data_in, current_mem : in std_logic_vector(31 downto 0);
    data_out : out std_logic_vector(31 downto 0);
    ReadMem_W, ReadMem_SH, ReadMem_UH, ReadMem_SB, ReadMem_UB, WriteMem_W, WriteMem_H, WriteMem_B, WE, OE, clk : in std_logic
    );
  
end entity;

architecture arch_memoire of memoire is
begin

end arch_memoire;