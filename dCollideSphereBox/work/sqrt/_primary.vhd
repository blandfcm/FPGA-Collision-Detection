library verilog;
use verilog.vl_types.all;
entity sqrt is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        n               : in     vl_logic_vector(31 downto 0);
        pos             : out    vl_logic;
        root            : out    vl_logic_vector(31 downto 0);
        out_rdy         : out    vl_logic
    );
end sqrt;
