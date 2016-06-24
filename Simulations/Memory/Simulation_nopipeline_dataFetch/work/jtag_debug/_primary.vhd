library verilog;
use verilog.vl_types.all;
entity jtag_debug is
    port(
        in_debug        : in     vl_logic_vector(31 downto 0)
    );
end jtag_debug;
