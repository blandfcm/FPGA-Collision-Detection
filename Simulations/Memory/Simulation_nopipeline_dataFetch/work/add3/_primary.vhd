library verilog;
use verilog.vl_types.all;
entity add3 is
    port(
        CLK             : in     vl_logic;
        a1              : in     vl_logic_vector(31 downto 0);
        a2              : in     vl_logic_vector(31 downto 0);
        a3              : in     vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        result          : out    vl_logic_vector(31 downto 0);
        out_rdy         : out    vl_logic
    );
end add3;
