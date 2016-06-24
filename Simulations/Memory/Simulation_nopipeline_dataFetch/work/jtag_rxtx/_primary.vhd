library verilog;
use verilog.vl_types.all;
entity jtag_rxtx is
    port(
        in_data         : in     vl_logic_vector(31 downto 0);
        out_data        : out    vl_logic_vector(31 downto 0)
    );
end jtag_rxtx;
