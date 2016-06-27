library verilog;
use verilog.vl_types.all;
entity fpga_dCollideSpheres is
    port(
        CLOCK_50        : in     vl_logic;
        CLOCK2_50       : in     vl_logic;
        CLOCK3_50       : in     vl_logic;
        KEY             : in     vl_logic_vector(3 downto 0);
        SW              : in     vl_logic
    );
end fpga_dCollideSpheres;
