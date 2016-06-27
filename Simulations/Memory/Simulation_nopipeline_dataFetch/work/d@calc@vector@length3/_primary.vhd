library verilog;
use verilog.vl_types.all;
entity dCalcVectorLength3 is
    port(
        CLK             : in     vl_logic;
        a1              : in     vl_logic_vector(31 downto 0);
        a2              : in     vl_logic_vector(31 downto 0);
        a3              : in     vl_logic_vector(31 downto 0);
        b1              : in     vl_logic_vector(31 downto 0);
        b2              : in     vl_logic_vector(31 downto 0);
        b3              : in     vl_logic_vector(31 downto 0);
        RST             : in     vl_logic;
        res             : out    vl_logic_vector(31 downto 0);
        out_rdy         : out    vl_logic
    );
end dCalcVectorLength3;
