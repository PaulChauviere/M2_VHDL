LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;


-- Definition de l'entite
entity test_lecture is
end test_lecture;
    
-- Definition de l'architecture
architecture arch_lecture of test_lecture is

-- definition de ressources externes
signal E_address, E_read_in : in std_logic_vector(31 downto 0);
signal E_read_out : out std_logic_vector(31 downto 0);
signal E_ReadMem_W, E_ReadMem_SH, E_ReadMem_UH, E_ReadMem_SB, E_ReadMem_UB : in std_logic


begin

regf0 : entity work.lecture(arch_lecture)
    port map( address => E_address, read_in => E_read_in, read_out => E_read_out, ReadMem_W => E_ReadMem_W, ReadMem_SH => E_ReadMem_SH, ReadMem_UH => E_ReadMem_UH, ReadMem_SB => E_ReadMem_SB, ReadMem_UB => E_ReadMem_UB);


P_Test: process
begin   
    E_address <= (others <= '0');
    E_ReadMem_W = '1';
    E_ReadMem_SH = '0';
    E_ReadMem_UH = '0';
    E_ReadMem_SB = '0';
    E_ReadMem_UB = '0';
    E_read_in = '10101010101010101010101010101110';

    wait for 5 ns;

    E_ReadMem_W = '0';
    E_ReadMem_SH = '1';

    wait for 5 ns;

    E_ReadMem_SH = '0';
    E_ReadMem_UH = '1';

    wait for 5 ns;
    
    E_ReadMem_UH = '1';
    E_ReadMem_SB = '0';


wait;

end process P_Test;

end arch_lecture;
