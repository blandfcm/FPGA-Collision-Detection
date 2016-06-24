library verilog;
use verilog.vl_types.all;
entity jtag_tx is
    port(
        out_data        : out    vl_logic_vector(31 downto 0)
    );
end jtag_tx;
