library verilog;
use verilog.vl_types.all;
entity myjtag is
    port(
        ir_out          : in     vl_logic_vector(2 downto 0);
        tdo             : in     vl_logic;
        ir_in           : out    vl_logic_vector(2 downto 0);
        tck             : out    vl_logic;
        tdi             : out    vl_logic;
        virtual_state_cdr: out    vl_logic;
        virtual_state_cir: out    vl_logic;
        virtual_state_e1dr: out    vl_logic;
        virtual_state_e2dr: out    vl_logic;
        virtual_state_pdr: out    vl_logic;
        virtual_state_sdr: out    vl_logic;
        virtual_state_udr: out    vl_logic;
        virtual_state_uir: out    vl_logic
    );
end myjtag;
