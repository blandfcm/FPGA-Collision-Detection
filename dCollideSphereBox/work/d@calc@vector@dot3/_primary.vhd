library verilog;
use verilog.vl_types.all;
entity dCalcVectorDot3 is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        a0              : in     vl_logic_vector(31 downto 0);
        a1              : in     vl_logic_vector(31 downto 0);
        a2              : in     vl_logic_vector(31 downto 0);
        b0              : in     vl_logic_vector(31 downto 0);
        b1              : in     vl_logic_vector(31 downto 0);
        b2              : in     vl_logic_vector(31 downto 0);
        result          : out    vl_logic_vector(31 downto 0);
        done_flag       : out    vl_logic
    );
end dCalcVectorDot3;
