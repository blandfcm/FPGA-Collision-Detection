library verilog;
use verilog.vl_types.all;
entity divider is
    generic(
        get_a           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        get_b           : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi0);
        unpack          : vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi1, Hi1);
        special_cases   : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi0);
        normalise_a     : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi0, Hi1);
        normalise_b     : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi0);
        divide_0        : vl_logic_vector(0 to 3) := (Hi0, Hi1, Hi1, Hi1);
        divide_1        : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi0);
        divide_2        : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi0, Hi1);
        divide_3        : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi0);
        normalise_1     : vl_logic_vector(0 to 3) := (Hi1, Hi0, Hi1, Hi1);
        normalise_2     : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi0);
        round           : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi0, Hi1);
        pack            : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi0);
        put_z           : vl_logic_vector(0 to 3) := (Hi1, Hi1, Hi1, Hi1)
    );
    port(
        input_a         : in     vl_logic_vector(31 downto 0);
        input_b         : in     vl_logic_vector(31 downto 0);
        input_a_stb     : in     vl_logic;
        input_b_stb     : in     vl_logic;
        output_z_ack    : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        output_z        : out    vl_logic_vector(31 downto 0);
        output_z_stb    : out    vl_logic;
        input_a_ack     : out    vl_logic;
        input_b_ack     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of get_a : constant is 1;
    attribute mti_svvh_generic_type of get_b : constant is 1;
    attribute mti_svvh_generic_type of unpack : constant is 1;
    attribute mti_svvh_generic_type of special_cases : constant is 1;
    attribute mti_svvh_generic_type of normalise_a : constant is 1;
    attribute mti_svvh_generic_type of normalise_b : constant is 1;
    attribute mti_svvh_generic_type of divide_0 : constant is 1;
    attribute mti_svvh_generic_type of divide_1 : constant is 1;
    attribute mti_svvh_generic_type of divide_2 : constant is 1;
    attribute mti_svvh_generic_type of divide_3 : constant is 1;
    attribute mti_svvh_generic_type of normalise_1 : constant is 1;
    attribute mti_svvh_generic_type of normalise_2 : constant is 1;
    attribute mti_svvh_generic_type of round : constant is 1;
    attribute mti_svvh_generic_type of pack : constant is 1;
    attribute mti_svvh_generic_type of put_z : constant is 1;
end divider;
